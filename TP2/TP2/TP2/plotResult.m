function  plotResult(Table,OutPut)

	for k=1:length(OutPut)
		if( OutPut(k) ==1)  plot(Table(k,1),Table(k,2),'+r','linewidth',2) ; hold on ; 
		else plot(Table(k,1),Table(k,2),'ob','linewidth',2) ; hold on ; 
		end
	end
	grid on ;xlim([-2 2]) ; ylim([-2 2]) ;	
end
