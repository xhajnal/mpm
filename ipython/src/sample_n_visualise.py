import numpy as np
import pylab as pl
from matplotlib import collections  as mc


def cartesian_product(*arrays):
    la = len(arrays)
    dtype = np.result_type(*arrays)
    arr = np.empty([len(a) for a in arrays] + [la], dtype=dtype)
    for i, a in enumerate(np.ix_(*arrays)):
        arr[...,i] = a
    return arr.reshape(-1, la)

 def sample(dic_fun,size_q):
    """ Samples probabilities of i successes for sampled parametrisation

    Parameters
    ----------
    dic_fun : dictionary N -> list of polynomes
    size_q : sample size in each parameter
    
    Returns array of [N,i,parameters,value]
    """
    arr = []
    for N in agents_quantities:
        for polynome in dic_fun[N]:
            parameters=set()
            if len(parameters)<N:
                parameters.update(find_param(polynome))
            #print(parameters)
            parameters= sorted(list(parameters))
            #print(parameters)
            parameter_values = []
            for param in range(len(parameters)):
                parameter_values.append(np.linspace(0, 1, size_q, endpoint=True)) 
            parameter_values=cartesian_product(*parameter_values)
            if (len(parameters)-1)==0:
                parameter_values=np.linspace(0, 1, size_q, endpoint=True)[np.newaxis, :].T
            #print(parameter_values)
            
            for parameter_value in parameter_values:
                #print(parameter_value)
                a=[N,dic_fun[N].index(polynome)]
                for param in range(len(parameters)):
                    a.append(parameter_value[param])
                    #print(parameters[param])
                    #print(parameter_value[param])
                    globals()[parameters[param]]= parameter_value[param]
                #print("eval ", polynome, eval(polynome))
                a.append(eval(polynome))
                arr.append(a)
    return arr

def visualise(dic_fun,size_q):
    """ Creates bar plot of probabilities of i successes for sampled parametrisation

    Parameters
    ----------
    dic_fun : dictionary N -> list of polynomes
    size_q : sample size in each parameter
    """
    for N in agents_quantities:
        parameters = set()
        for polynome in dic_fun[N]:
            if len(parameters)<N:
                parameters.update(find_param(polynome))
        #print(parameters)
        parameters = sorted(list(parameters))
        #print(parameters)
        parameter_values = []
        for param in range(len(parameters)):
            parameter_values.append(np.linspace(0, 1, size_q, endpoint=True)) 
        parameter_values=cartesian_product(*parameter_values)
        if (len(parameters)-1)==0:
            parameter_values=np.linspace(0, 1, size_q, endpoint=True)[np.newaxis, :].T
        #print(parameter_values)
            
        for parameter_value in parameter_values:
            #print(parameter_value)
            a=[N,dic_fun[N].index(polynome)]
            title=""
            for param in range(len(parameters)):
                a.append(parameter_value[param])
                #print(parameters[param])
                #print(parameter_value[param])
                globals()[parameters[param]]= parameter_value[param]
                title = "{}{}={} ".format(title,parameters[param],parameter_value[param])
            #print("eval ", polynome, eval(polynome))
            for polynome in dic_fun[N]:
                a.append(eval(polynome))
            
            print(a)
            fig, ax = plt.subplots()
            width = 0.2
            ax.set_ylabel('Probability')
            ax.set_xlabel('i')
            ax.set_title('N={} {}'.format(N,title))
            rects1 = ax.bar(range(N+1), a[len(parameters)+2:], width, color='b')
            plt.show()

def visualise_byparam(hyper_rectangles):
    """
    Visualise intervals of each dimension in plot.
    
    Parameters
    ----------
    hyper_rectangles : list of hyperrectangles
    """
    
    #https://stackoverflow.com/questions/21352580/matplotlib-plotting-numerous-disconnected-line-segments-with-different-colors
    if hyper_rectangles:
        lines=[]
        for i in range(len(hyper_rectangles[0])):
            for j in range(len(hyper_rectangles)):
                #print(hyper_rectangles_sat[j][i])
                lines.append([(i+1, hyper_rectangles[j][i][0]), (i+1, hyper_rectangles[j][i][1])])
                #print([(i+1, hyper_rectangles_sat[j][i][0]), (i+1, hyper_rectangles_sat[j][i][1])])
        c = np.array([(1, 0, 0, 1), (0, 1, 0, 1), (0, 0, 1, 1)])

        lc = mc.LineCollection(lines, color='g',linewidths=2)
        

        fig, ax = pl.subplots()

        ax.set_xlabel('params')
        ax.set_ylabel('parameter value')
        ax.set_title("intervals in which are parameter in green regions")
        
        ax.add_collection(lc)
        ax.autoscale()
        ax.margins(0.1)
    else:
        print("No green areas to be visualised")
