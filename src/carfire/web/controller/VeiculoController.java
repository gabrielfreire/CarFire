package carfire.web.controller;

import java.util.ArrayList;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.event.ValueChangeEvent;

import carfire.web.model.dao.VeiculoDAO;
import carfire.web.model.to.VeiculoTO;

@ManagedBean(name = "veiculoController")
@RequestScoped
public class VeiculoController {

	/**
	 * 
	 */
	private VeiculoTO veiculoTO = null;
	private VeiculoDAO veiculoDAO = null;

	
	public VeiculoController() {
		veiculoTO = new VeiculoTO();
		veiculoDAO = new VeiculoDAO();
	}

	
	/**
	 * 
	 * @return
	 */
	public ArrayList<VeiculoTO> itens() {
		return veiculoDAO.listarItens();
	}

	
	/**
	 * Alterar combo de ve�culos quando selecionar um grupo
	 * @param e
	 */
	public ArrayList<VeiculoTO> getListaByGrupo(ValueChangeEvent e) {	
		
		long idGrupoSelecionado = Long.parseLong(e.getNewValue().toString());
		return veiculoDAO.listarItensByGrupo(idGrupoSelecionado);
	}


	/**
	 * 
	 * @return
	 */
	public String excluir() {	
		veiculoDAO.excluir(veiculoTO.getId());
		return null;
	}

	/**
	 * 
	 * @return
	 */
	public String editar() {
		return "formCar";
	}

	/**
	 * 
	 * @return
	 */
	public String salvar() {
		if (veiculoTO.getId() == 0) {
			veiculoDAO.inserir(veiculoTO);

		} else {
			veiculoDAO.editar(veiculoTO);
		}
		return "listCars";
	}

	
	
	/**************************************/
	/* Getter e setters                   */
	/**************************************/
	public VeiculoDAO getVeiculoDAO() {
		return veiculoDAO;
	}	
	public VeiculoTO getVeiculoTO() {
		return veiculoTO;
	}
	public void setVeiculoDAO(VeiculoDAO veiculo) {
		veiculoDAO = veiculo;
	}
	public void setVeiculoTO(VeiculoTO veiculo) {
		veiculoTO = veiculo;
	}
	
}
