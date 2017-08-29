function showsq(s)
hold on
m = max(size(s));
gord = 3;
leg = [];
for n = 1:m
    [x,y] = elipson(s(n));
    plot(x,y,'LineWidth',gord)
    gord = gord - 2/(m-1);
    str = strcat('s = ',num2str(s(n)));
    str = {str};
    leg = [leg; str];
end
legend(leg);
grid on
xlabel('x');
ylabel('y');
saveas(gcf,'showsq.png');

end

