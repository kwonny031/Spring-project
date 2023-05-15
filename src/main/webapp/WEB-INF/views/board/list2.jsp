<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- -------------------------------------------------------------- -->
<!-- Email App Part -->
<!-- -------------------------------------------------------------- -->
<div class="email-app">
	<!-- -------------------------------------------------------------- -->
	<!-- Left Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="left-part" style="background-color: white;">
		<a class="ri-menu-fill ri-close-fill btn btn-success show-left-part d-block d-md-none" href="javascript:void(0)"></a>
		<div class="scrollable" style="height: 100%">
			<div class="p-3">
				<a id="compose_mail" class="waves-effect waves-light btn btn-danger d-block" href="javascript: void(0)">Compose</a>
			</div>
			<div class="divider"></div>
			<ul class="list-group">
				<li>
					<small class="p-3 grey-text text-lighten-1 db">Folders</small>
				</li>
				<li class="list-group-item">
					<a href="javascript:void(0)" class="active list-group-item-action d-flex align-items-center">
						<i data-feather="inbox" class="feather-sm fill-white me-2"></i> Inbox
						<span class="badge bg-light-success text-success px-3 rounded-pill font-medium ms-auto">6</span>
                    </a>
				</li>
				<li class="list-group-item">
					<a href="javascript:void(0)" class="list-group-item-action"> 
						<i data-feather="star" class="feather-sm fill-white me-2"></i> Starred
					</a>
				</li>
				<li class="list-group-item">
					<a href="javascript:void(0)" class="list-group-item-action d-flex align-items-center">
						<i data-feather="send" class="feather-sm fill-white me-2"></i>
						Draft 
						<span class="badge bg-light-danger text-danger font-medium px-3 rounded-pill ms-auto">3</span>
					</a>
				</li>
				<li class="list-group-item">
					<a href="javascript:void(0)" class="list-group-item-action"> 
						<i data-feather="mail" class="feather-sm fill-white me-2"></i> Sent Mail
					</a>
				</li>
				<li class="list-group-item">
					<hr />
				</li>
				<li class="list-group-item">
					<a href="javascript:void(0)"
					class="list-group-item-action"> <i data-feather="slash"
						class="feather-sm fill-white me-2"></i> Spam
				</a></li>
				<li class="list-group-item">
					<a href="javascript:void(0)" class="list-group-item-action"> 
						<i data-feather="trash-2" class="feather-sm fill-white me-2"></i> Trash
				</a></li>
				<li class="list-group-item">
					<hr />
				</li>
				<li><small class="p-3 grey-text text-lighten-1 db">Labels</small>
				</li>
				<li id="dataBtn" class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-danger ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						temp data </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-cyan ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Business </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-warning ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Family </a></li>
				<li class="list-group-item"><a href="javascript:void(0)"
					class="list-group-item-action"><i
						class="text-info ri-checkbox-blank-circle-fill fs-5 align-middle"></i>
						Friends </a></li>
			</ul>
		</div>
	</div>
	<!-- -------------------------------------------------------------- -->
	<!-- Right Part -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-list bg-white overflow-auto" style="background-color: #eef5f9 !important;
		margin-left: 261px;">
		<div class="p-3 b-b">
			<div class="d-flex align-items-center">
				<div>
					<h4>${boa.boaName }</h4>
					<span>Here is the list of mail</span>
				</div>
				<div class="ms-auto">
					<input placeholder="Search Mail" id="" type="text"
						class="form-control" />
				</div>
			</div>
		</div>



		<!-- -------------------------------------------------------------- -->
		<!-- Active user - project- visitors -->
		<!-- -------------------------------------------------------------- -->
		<div class="row" style="width: 99%; margin-left: 6px;">
			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">Device Visit</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>
						
						<div id="chart1" class="d-flex">
						
						</div>					
						
					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>
			
			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">Device Visit</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>
						
						<div id="chart2" class="d-flex">
						
						</div>					
						
					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>
			
			<!-- column -->
			<div class="col-sm-12 col-lg-4 d-flex align-items-stretch">
				<!-- ---------------------
                            start Active Users
                        ---------------- -->
				<div class="card card-hover w-100">
					<div class="card-body">
						<h4 class="card-title">Device Visit</h4>
						<div id="device-visit" class="mt-4 d-flex justify-content-center"></div>
						
						<div id="chart3" class="d-flex">
						
						</div>					
						
					</div>
				</div>
				<!-- ---------------------
                            end Active Users
                        ---------------- -->
			</div>
			
			
		</div>



		<div class="row">
			<div class="col-12">
				<!-- ---------------------
                            start Zero Configuration
                        ---------------- -->
				<div class="card" style="width: 97.6%; margin-left: 15px;">
    				
					<div class="border-bottom title-part-padding">
						<h4 class="card-title mb-0">Zero Configuration</h4>
					</div>
					<div class="card-body">
						<h6 class="card-subtitle mb-3">
							DataTables has most features enabled by default, so all you need
							to do to use it with your own tables is to call the construction
							function:
							<code> $().DataTable();</code>
							. You can refer full documentation from here <a
								href="https://datatables.net/">Datatables</a>
						</h6>
						<div class="table-responsive">
							<table id="zero_config"
								class="table table-striped table-bordered text-nowrap">
								<thead>
									<!-- start row -->
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
									<!-- end row -->
								</thead>
								<tbody>
									<!-- start row -->
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Garrett Winters</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>63</td>
										<td>2011/07/25</td>
										<td>$170,750</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Ashton Cox</td>
										<td>Junior Technical Author</td>
										<td>San Francisco</td>
										<td>66</td>
										<td>2009/01/12</td>
										<td>$86,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Cedric Kelly</td>
										<td>Senior Javascript Developer</td>
										<td>Edinburgh</td>
										<td>22</td>
										<td>2012/03/29</td>
										<td>$433,060</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Airi Satou</td>
										<td>Accountant</td>
										<td>Tokyo</td>
										<td>33</td>
										<td>2008/11/28</td>
										<td>$162,700</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Brielle Williamson</td>
										<td>Integration Specialist</td>
										<td>New York</td>
										<td>61</td>
										<td>2012/12/02</td>
										<td>$372,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Herrod Chandler</td>
										<td>Sales Assistant</td>
										<td>San Francisco</td>
										<td>59</td>
										<td>2012/08/06</td>
										<td>$137,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Rhona Davidson</td>
										<td>Integration Specialist</td>
										<td>Tokyo</td>
										<td>55</td>
										<td>2010/10/14</td>
										<td>$327,900</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Colleen Hurst</td>
										<td>Javascript Developer</td>
										<td>San Francisco</td>
										<td>39</td>
										<td>2009/09/15</td>
										<td>$205,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Sonya Frost</td>
										<td>Software Engineer</td>
										<td>Edinburgh</td>
										<td>23</td>
										<td>2008/12/13</td>
										<td>$103,600</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jena Gaines</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>30</td>
										<td>2008/12/19</td>
										<td>$90,560</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Quinn Flynn</td>
										<td>Support Lead</td>
										<td>Edinburgh</td>
										<td>22</td>
										<td>2013/03/03</td>
										<td>$342,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Charde Marshall</td>
										<td>Regional Director</td>
										<td>San Francisco</td>
										<td>36</td>
										<td>2008/10/16</td>
										<td>$470,600</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Haley Kennedy</td>
										<td>Senior Marketing Designer</td>
										<td>London</td>
										<td>43</td>
										<td>2012/12/18</td>
										<td>$313,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Tatyana Fitzpatrick</td>
										<td>Regional Director</td>
										<td>London</td>
										<td>19</td>
										<td>2010/03/17</td>
										<td>$385,750</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Michael Silva</td>
										<td>Marketing Designer</td>
										<td>London</td>
										<td>66</td>
										<td>2012/11/27</td>
										<td>$198,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Paul Byrd</td>
										<td>Chief Financial Officer (CFO)</td>
										<td>New York</td>
										<td>64</td>
										<td>2010/06/09</td>
										<td>$725,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Gloria Little</td>
										<td>Systems Administrator</td>
										<td>New York</td>
										<td>59</td>
										<td>2009/04/10</td>
										<td>$237,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Bradley Greer</td>
										<td>Software Engineer</td>
										<td>London</td>
										<td>41</td>
										<td>2012/10/13</td>
										<td>$132,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Dai Rios</td>
										<td>Personnel Lead</td>
										<td>Edinburgh</td>
										<td>35</td>
										<td>2012/09/26</td>
										<td>$217,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jenette Caldwell</td>
										<td>Development Lead</td>
										<td>New York</td>
										<td>30</td>
										<td>2011/09/03</td>
										<td>$345,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Yuri Berry</td>
										<td>Chief Marketing Officer (CMO)</td>
										<td>New York</td>
										<td>40</td>
										<td>2009/06/25</td>
										<td>$675,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Caesar Vance</td>
										<td>Pre-Sales Support</td>
										<td>New York</td>
										<td>21</td>
										<td>2011/12/12</td>
										<td>$106,450</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Doris Wilder</td>
										<td>Sales Assistant</td>
										<td>Sidney</td>
										<td>23</td>
										<td>2010/09/20</td>
										<td>$85,600</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Angelica Ramos</td>
										<td>Chief Executive Officer (CEO)</td>
										<td>London</td>
										<td>47</td>
										<td>2009/10/09</td>
										<td>$1,200,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Gavin Joyce</td>
										<td>Developer</td>
										<td>Edinburgh</td>
										<td>42</td>
										<td>2010/12/22</td>
										<td>$92,575</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jennifer Chang</td>
										<td>Regional Director</td>
										<td>Singapore</td>
										<td>28</td>
										<td>2010/11/14</td>
										<td>$357,650</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Brenden Wagner</td>
										<td>Software Engineer</td>
										<td>San Francisco</td>
										<td>28</td>
										<td>2011/06/07</td>
										<td>$206,850</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Fiona Green</td>
										<td>Chief Operating Officer (COO)</td>
										<td>San Francisco</td>
										<td>48</td>
										<td>2010/03/11</td>
										<td>$850,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Shou Itou</td>
										<td>Regional Marketing</td>
										<td>Tokyo</td>
										<td>20</td>
										<td>2011/08/14</td>
										<td>$163,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Michelle House</td>
										<td>Integration Specialist</td>
										<td>Sidney</td>
										<td>37</td>
										<td>2011/06/02</td>
										<td>$95,400</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Suki Burks</td>
										<td>Developer</td>
										<td>London</td>
										<td>53</td>
										<td>2009/10/22</td>
										<td>$114,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Prescott Bartlett</td>
										<td>Technical Author</td>
										<td>London</td>
										<td>27</td>
										<td>2011/05/07</td>
										<td>$145,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Gavin Cortez</td>
										<td>Team Leader</td>
										<td>San Francisco</td>
										<td>22</td>
										<td>2008/10/26</td>
										<td>$235,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Martena Mccray</td>
										<td>Post-Sales support</td>
										<td>Edinburgh</td>
										<td>46</td>
										<td>2011/03/09</td>
										<td>$324,050</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Unity Butler</td>
										<td>Marketing Designer</td>
										<td>San Francisco</td>
										<td>47</td>
										<td>2009/12/09</td>
										<td>$85,675</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Howard Hatfield</td>
										<td>Office Manager</td>
										<td>San Francisco</td>
										<td>51</td>
										<td>2008/12/16</td>
										<td>$164,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Hope Fuentes</td>
										<td>Secretary</td>
										<td>San Francisco</td>
										<td>41</td>
										<td>2010/02/12</td>
										<td>$109,850</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Vivian Harrell</td>
										<td>Financial Controller</td>
										<td>San Francisco</td>
										<td>62</td>
										<td>2009/02/14</td>
										<td>$452,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Timothy Mooney</td>
										<td>Office Manager</td>
										<td>London</td>
										<td>37</td>
										<td>2008/12/11</td>
										<td>$136,200</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jackson Bradshaw</td>
										<td>Director</td>
										<td>New York</td>
										<td>65</td>
										<td>2008/09/26</td>
										<td>$645,750</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Olivia Liang</td>
										<td>Support Engineer</td>
										<td>Singapore</td>
										<td>64</td>
										<td>2011/02/03</td>
										<td>$234,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Bruno Nash</td>
										<td>Software Engineer</td>
										<td>London</td>
										<td>38</td>
										<td>2011/05/03</td>
										<td>$163,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Sakura Yamamoto</td>
										<td>Support Engineer</td>
										<td>Tokyo</td>
										<td>37</td>
										<td>2009/08/19</td>
										<td>$139,575</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Thor Walton</td>
										<td>Developer</td>
										<td>New York</td>
										<td>61</td>
										<td>2013/08/11</td>
										<td>$98,540</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Finn Camacho</td>
										<td>Support Engineer</td>
										<td>San Francisco</td>
										<td>47</td>
										<td>2009/07/07</td>
										<td>$87,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Serge Baldwin</td>
										<td>Data Coordinator</td>
										<td>Singapore</td>
										<td>64</td>
										<td>2012/04/09</td>
										<td>$138,575</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Zenaida Frank</td>
										<td>Software Engineer</td>
										<td>New York</td>
										<td>63</td>
										<td>2010/01/04</td>
										<td>$125,250</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Zorita Serrano</td>
										<td>Software Engineer</td>
										<td>San Francisco</td>
										<td>56</td>
										<td>2012/06/01</td>
										<td>$115,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jennifer Acosta</td>
										<td>Junior Javascript Developer</td>
										<td>Edinburgh</td>
										<td>43</td>
										<td>2013/02/01</td>
										<td>$75,650</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Cara Stevens</td>
										<td>Sales Assistant</td>
										<td>New York</td>
										<td>46</td>
										<td>2011/12/06</td>
										<td>$145,600</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Hermione Butler</td>
										<td>Regional Director</td>
										<td>London</td>
										<td>47</td>
										<td>2011/03/21</td>
										<td>$356,250</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Lael Greer</td>
										<td>Systems Administrator</td>
										<td>London</td>
										<td>21</td>
										<td>2009/02/27</td>
										<td>$103,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Jonas Alexander</td>
										<td>Developer</td>
										<td>San Francisco</td>
										<td>30</td>
										<td>2010/07/14</td>
										<td>$86,500</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Shad Decker</td>
										<td>Regional Director</td>
										<td>Edinburgh</td>
										<td>51</td>
										<td>2008/11/13</td>
										<td>$183,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Michael Bruce</td>
										<td>Javascript Developer</td>
										<td>Singapore</td>
										<td>29</td>
										<td>2011/06/27</td>
										<td>$183,000</td>
									</tr>
									<!-- end row -->
									<!-- start row -->
									<tr>
										<td>Donna Snider</td>
										<td>Customer Support</td>
										<td>New York</td>
										<td>27</td>
										<td>2011/01/25</td>
										<td>$112,000</td>
									</tr>
									<!-- end row -->
								</tbody>
								<tfoot>
									<!-- start row -->
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
									<!-- end row -->
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<!-- ---------------------
                            end Zero Configuration
                        ---------------- -->
			</div>
		</div>










	</div>
	<!-- -------------------------------------------------------------- -->
	<!-- Right Part  Mail Compose -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-compose bg-white overflow-auto"
		style="display: none">
		<div class="p-4 border-bottom">
			<div class="d-flex align-items-center">
				<div>
					<h4>Compose</h4>
					<span>create new message</span>
				</div>
				<div class="ms-auto">
					<button id="cancel_compose" class="btn btn-dark">Back</button>
				</div>
			</div>
		</div>
		<!-- Action part -->
		<!-- Button group part -->
		<div class="card-body">
			<form>
				<div class="mb-3">
					<input type="email" id="example-email" name="example-email"
						class="form-control" placeholder="To" />
				</div>
				<div class="mb-3">
					<input type="text" id="example-subject" name="example-subject"
						class="form-control" placeholder="Subject" />
				</div>
				<div id="summernote"></div>
				<h4>Attachment</h4>
				<div class="dropzone" id="dzid">
					<div class="fallback">
						<input name="file" type="file" multiple />
					</div>
				</div>
				<button type="submit" class="btn btn-success mt-3">
					<i class="ri-mail-line align-middle"></i> Send
				</button>
				<button type="submit" class="btn btn-dark mt-3">Discard</button>
			</form>
			<!-- Action part -->
		</div>
	</div>
	<!-- -------------------------------------------------------------- -->
	<!-- Right Part  Mail detail -->
	<!-- -------------------------------------------------------------- -->
	<div class="right-part mail-details bg-white overflow-auto"
		style="display: none">
		<div class="card-body bg-light">
			<button type="button" id="back_to_inbox"
				class="btn btn-outline-secondary fs-5 me-2">
				<i class="mdi mdi-arrow-left"></i>
			</button>
			<div class="btn-group me-2" role="group"
				aria-label="Button group with nested dropdown">
				<button type="button" class="btn btn-outline-secondary fs-5">
					<i class="bi-arrow-clockwise"></i>
				</button>
				<button type="button" class="btn btn-outline-secondary fs-5">
					<i class="ri-spam-2-fill"></i>
				</button>
				<button type="button" class="btn btn-outline-secondary fs-5">
					<i class="ri-delete-bin-7-fill"></i>
				</button>
			</div>
			<div class="btn-group me-2" role="group"
				aria-label="Button group with nested dropdown">
				<div class="btn-group" role="group">
					<button id="btnGroupDrop1" type="button"
						class="btn btn-outline-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<i class="ri-folder-fill fs-5"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						<a class="dropdown-item" href="javascript:void(0)">Dropdown
							link</a> <a class="dropdown-item" href="javascript:void(0)">Dropdown
							link</a>
					</div>
				</div>
				<div class="btn-group" role="group">
					<button id="btnGroupDrop1" type="button"
						class="btn btn-outline-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<i class="ri-price-tag-fill fs-5"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
						<a class="dropdown-item" href="javascript:void(0)">Dropdown
							link</a> <a class="dropdown-item" href="javascript:void(0)">Dropdown
							link</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card-body border-bottom">
			<h4 class="mb-0">Your Message title goes here</h4>
		</div>
		<div class="card-body border-bottom">
			<div class="d-flex no-block align-items-center mb-5">
				<div class="me-2">
					<img src="../../assets/images/users/1.jpg" alt="user"
						class="rounded-circle" width="45" />
				</div>
				<div class="">
					<h5 class="mb-0 fs-4 font-medium">
						Hanna Gover <small> ( hgover@gmail.com )</small>
					</h5>
					<span>to Suniljoshi19@gmail.com</span>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-11">
					<h4 class="mb-3">Hey Hi,</h4>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
						Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
						penatibus et magnis dis parturient montes, nascetur ridiculus mus.
						Donec quam felis, ultricies nec, pellentesque eu, pretium quis,
						sem.Nulla consequat massa quis enim. Donec pede justo, fringilla
						vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,
						imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede
						mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum
						semper nisi.</p>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
						Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
						penatibus et magnis dis parturient montes, nascetur ridiculus mus.
						Donec quam felis, ultricies nec, pellentesque eu, pretium quis,
						sem.Nulla consequat massa quis enim. Donec pede justo, fringilla
						vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut,
						imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede
						mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum
						semper nisi.</p>
				</div>
			</div>
		</div>
		<div class="card-body">
			<h4>
				<i data-feather="paperclip" class="feather-sm me-2 mb-2"></i>
				Attachments <span>(3)</span>
			</h4>
			<div class="row">
				<div class="col-md-2">
					<a href="javascript:void(0)"> <img
						class="img-thumbnail img-responsive" alt="attachment"
						src="../../assets/images/big/img1.jpg" />
					</a>
				</div>
				<div class="col-md-2">
					<a href="javascript:void(0)"> <img
						class="img-thumbnail img-responsive" alt="attachment"
						src="../../assets/images/big/img2.jpg" />
					</a>
				</div>
				<div class="col-md-2">
					<a href="javascript:void(0)"> <img
						class="img-thumbnail img-responsive" alt="attachment"
						src="../../assets/images/big/img3.jpg" />
					</a>
				</div>
			</div>
			<div class="border mt-3 p-3">
				<p class="pb-3">
					click here to <a href="javascript:void(0)">Reply</a> or <a
						href="javascript:void(0)">Forward</a>
				</p>
			</div>
		</div>
	</div>
</div>

<!-- chart -->
<script src="${pageContext.request.contextPath}/resources/assets/libs/flot/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery.flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/pages/dashboards/dashboard2.js"></script>

<!-- dataTable -->
<script src="${pageContext.request.contextPath}/resources/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/pages/datatable/datatable-basic.init.js"></script>

<script type="text/javascript">
	// IT 지원요청
	// 1. 
	// 2.
	// 3.
	
	// 거래처 관리
	// 1. 
	// 2.
	// 3.
	
	// 매출 관리
	// 1. 7~12월 전체 매출. 막대 그래프 
	// 2. 7~12월 담당자 별 매출. 꺾은선 그래프
	// 3.

	var options1 = {
	  series: [{
	  name: 'Net Profit',
	  data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
	}, {
	  name: 'Revenue',
	  data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
	}, {
	  name: 'Free Cash Flow',
	  data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
	}],
	  chart: {
	  type: 'bar',
	  height: 350
	},
	plotOptions: {
	  bar: {
	    horizontal: false,
	    columnWidth: '55%',
	    endingShape: 'rounded'
	  },
	},
	dataLabels: {
	  enabled: false
	},
	stroke: {
	  show: true,
	  width: 2,
	  colors: ['transparent']
	},
	xaxis: {
	  categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
	},
	yaxis: {
	  title: {
	    text: '$ (thousands)'
	  }
	},
	fill: {
	  opacity: 1
	},
	tooltip: {
	  y: {
	    formatter: function (val) {
	      return "$ " + val + " thousands"
	    }
	  }
	}
	};

	var chart1 = new ApexCharts(document.querySelector("#chart1"), options1);
	chart1.render();
	

	var options2 = {
		series : [ {
			name : "High - 2013",
			data : [ 28, 29, 33, 36, 32, 32, 33 ]
		}, {
			name : "Low - 2013",
			data : [ 12, 11, 14, 18, 17, 13, 13 ]
		} ],
		chart : {
			height : 350,
			type : 'line',
			dropShadow : {
				enabled : true,
				color : '#000',
				top : 18,
				left : 7,
				blur : 10,
				opacity : 0.2
			},
			toolbar : {
				show : false
			}
		},
		colors : [ '#77B6EA', '#545454' ],
		dataLabels : {
			enabled : true,
		},
		stroke : {
			curve : 'smooth'
		},
		grid : {
			borderColor : '#e7e7e7',
			row : {
				colors : [ '#f3f3f3', 'transparent' ], // takes an array which will be repeated on columns
				opacity : 0.5
			},
		},
		markers : {
			size : 1
		},
		xaxis : {
			categories : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul' ],
			title : {
				text : 'Month'
			}
		},
		yaxis : {
			title : {
				text : 'Temperature'
			},
			min : 5,
			max : 40
		},
		legend : {
			position : 'top',
			horizontalAlign : 'right',
			floating : true,
			offsetY : -25,
			offsetX : -5
		}
	};

	var chart2 = new ApexCharts(document.querySelector("#chart2"), options2);
	chart2.render();

	
	var options3 = {
		series : [ 44, 55, 13, 43, 22 ],
		chart : {
			width : 380,
			type : 'pie',
		},
		labels : [ 'Team A', 'Team B', 'Team C', 'Team D', 'Team E' ],
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 200
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};

	var chart3 = new ApexCharts(document.querySelector("#chart3"), options3);
	chart3.render();
	
	document.addEventListener('DOMContentLoaded', () => {
		console.log('chart',document.querySelector('#SvgjsSvg1009'));
		let div3 = document.querySelector('#SvgjsSvg1009');
		div3.style.display = 'inline-block';
		div3.style.width = 419+'px';
		
		let div3Div = div3.children[0];
		div3Div.style.width = 420+'px';
		
		let div3Option = div3Div.children[0];
		div3Option.style.left = 328+'px'; 
		div3Option.style.top = -3+'px'; 
		
		console.log('op1',options1);
	});
	
	document.querySelector('#dataBtn').addEventListener('click',()=>{
		location.href = '/board/list2?flag=T';
	});
</script>





