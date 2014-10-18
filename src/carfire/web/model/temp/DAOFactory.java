package carfire.web.model.temp;



public abstract class DAOFactory {

    /**
     * Cria um novo DAOFactory. O tipo real � definido por: 
���� * A propriedade bexee.dao.factory. 
���� * 
���� * Se n�o estiver definido, ent�o MemoryDAOFactory ser� criado.
     */
    public static DAOFactory getInstance() {
    	return getInstance();
    }

    /**
     * As f�bricas concretas implementar�o este m�todo
     */
    public abstract IPessoaFisicaDAO createPessoaFisicaDAO();

    /**
     * As f�bricas concretas implementar�o este m�todo
     */
    public abstract IPessoaJuridicaDAO createPessoaJuridicaDAO();
}
