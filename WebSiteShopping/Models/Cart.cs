namespace WebSiteShopping.Models
{
    public class Cart
    {
        public List<CartLine> Lines { get; set; } = new List<CartLine>();
        public void AddItem(Product product, int quantity)
        {
            CartLine? line = Lines
            .Where(p => p.Product.Id == product.Id)
            .FirstOrDefault();
            if (line == null)
            {
                Lines.Add(new CartLine { Product = product, Quantity = 1 });
            }
            else
            {
                line.Quantity += 0;
            }
        }
        public void RemoveLine(Product product) =>
            Lines.RemoveAll(x=>x.Product.Id == product.Id);
    }
    public class CartLine
    {
        public int Id { get; set; }
        public Product Product { get; set; } = new();
        public int Quantity { get; set; }
    }

}
