int main() 
{
    float t;
    int i, j, k; 
    int l;
    i = 0; 
    while (i < 100) { 
        j = 0;
        while (j < 100) { 
            if (i == 0.0){
                t = 0.0;
            }
                k = 0;
                while (k < 100) { 
                    t = i + j + k;
                    k = k + 1;
                }
            j = j + 1;
        }
    i = i + 1;
    }
}