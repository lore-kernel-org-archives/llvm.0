Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB32366
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 05:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654059827; x=1685595827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nzKT/W+u2J6DUsc4PeuRgdvNwHg75yCbURG7KzHsOAg=;
  b=SRt/+ii4teWc6kyRB1F22x94Nt2DiwH+WWOcGeMMLTjsYaIGnQAx5bgi
   h+VWdJmhDzwL/1tGV2N7cHtTKbGdnDuNOBd3Ozk3651uimgN0d3DTALFj
   VFiCx9gSFk2KXTZuVCgKKCO1ferNJmlTufzV2FLHg476aMKKmiiuU0paQ
   jbjx/fujxK/xBMl/LM9qXD14pL00xDKu7jrfQKzSP+TxhWePeLrw3vFyy
   lRPzp3JcfX1OOJuGLF6zCDO9Brik+EnNcU8QpR88fvZoSIhGBaorD+eAg
   3IOP/S8gOHm4LZhWQQ5WK63l4ZI9k/1cenJ6YGg5+E0GV1JnKmCyA6VL9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255950058"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="255950058"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 22:03:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="755621307"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 May 2022 22:03:45 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwGWG-0003Yu-QL;
	Wed, 01 Jun 2022 05:03:44 +0000
Date: Wed, 1 Jun 2022 13:03:42 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2] vdpa: Do not count the pages that were already
 pinned in the vhost-vDPA
Message-ID: <202206011237.d34xUNB3-lkp@intel.com>
References: <20220601012019.1102186-1-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601012019.1102186-1-lulu@redhat.com>

Hi Cindy,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.18]
[cannot apply to mst-vhost/linux-next next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vdpa-Do-not-count-the-pages-that-were-already-pinned-in-the-vhost-vDPA/20220601-092308
base:    4b0986a3613c92f4ec1bdc7f60ec66fea135991f
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220601/202206011237.d34xUNB3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8f0b25afe9ac570a70eafb5c285747e3bdd2471d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cindy-Lu/vdpa-Do-not-count-the-pages-that-were-already-pinned-in-the-vhost-vDPA/20220601-092308
        git checkout 8f0b25afe9ac570a70eafb5c285747e3bdd2471d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vhost/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vhost/vdpa.c:555:5: warning: no previous prototype for function 'vhost_vdpa_add_range_ctx' [-Wmissing-prototypes]
   int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last,
       ^
   drivers/vhost/vdpa.c:555:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last,
   ^
   static 
>> drivers/vhost/vdpa.c:727:10: warning: data argument not used by format string [-Wformat-extra-args]
                          "%s %d FAIL start %lld last %lld node->start %lld  node->last %lld i  %d",
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^
>> drivers/vhost/vdpa.c:588:5: warning: no previous prototype for function 'vhost_vdpa_range_ref_add' [-Wmissing-prototypes]
   u64 vhost_vdpa_range_ref_add(struct rb_root_cached *root,
       ^
   drivers/vhost/vdpa.c:588:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 vhost_vdpa_range_ref_add(struct rb_root_cached *root,
   ^
   static 
   drivers/vhost/vdpa.c:856:11: warning: data argument not used by format string [-Wformat-extra-args]
                                  "%s %d FAIL  start %lld last %lld node->start %lld  node->last %lld new_ref %d",
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^
   drivers/vhost/vdpa.c:872:10: warning: data argument not used by format string [-Wformat-extra-args]
                          "%s %d FAIL start %lld last %lld node->start %lld  node->last %lld range_size  %d",
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^
>> drivers/vhost/vdpa.c:735:5: warning: no previous prototype for function 'vhost_vdpa_range_ref_del' [-Wmissing-prototypes]
   u64 vhost_vdpa_range_ref_del(struct rb_root_cached *root,
       ^
   drivers/vhost/vdpa.c:735:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 vhost_vdpa_range_ref_del(struct rb_root_cached *root,
   ^
   static 
>> drivers/vhost/vdpa.c:879:24: warning: no previous prototype for function 'vhost_vdpa_merge_list' [-Wmissing-prototypes]
   struct vdpa_link_node *vhost_vdpa_merge_list(struct vdpa_link_node *list1,
                          ^
   drivers/vhost/vdpa.c:879:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct vdpa_link_node *vhost_vdpa_merge_list(struct vdpa_link_node *list1,
   ^
   static 
>> drivers/vhost/vdpa.c:903:24: warning: no previous prototype for function 'vhost_vdpa_get_mid' [-Wmissing-prototypes]
   struct vdpa_link_node *vhost_vdpa_get_mid(struct vdpa_link_node *head)
                          ^
   drivers/vhost/vdpa.c:903:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct vdpa_link_node *vhost_vdpa_get_mid(struct vdpa_link_node *head)
   ^
   static 
>> drivers/vhost/vdpa.c:916:24: warning: no previous prototype for function 'vhost_vdpa_sort_list' [-Wmissing-prototypes]
   struct vdpa_link_node *vhost_vdpa_sort_list(struct vdpa_link_node *head)
                          ^
   drivers/vhost/vdpa.c:916:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct vdpa_link_node *vhost_vdpa_sort_list(struct vdpa_link_node *head)
   ^
   static 
>> drivers/vhost/vdpa.c:931:5: warning: no previous prototype for function 'vhost_vdpa_range_ops' [-Wmissing-prototypes]
   u64 vhost_vdpa_range_ops(struct rb_root_cached *root, u64 start, u64 last,
       ^
   drivers/vhost/vdpa.c:931:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 vhost_vdpa_range_ops(struct rb_root_cached *root, u64 start, u64 last,
   ^
   static 
>> drivers/vhost/vdpa.c:949:7: warning: variable 'link_head_tmp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (link_node == NULL) {
                       ^~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:978:18: note: uninitialized use occurs here
           pre_link_node = link_head_tmp;
                           ^~~~~~~~~~~~~
   drivers/vhost/vdpa.c:949:3: note: remove the 'if' if its condition is always false
                   if (link_node == NULL) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c:941:38: note: initialize the variable 'link_head_tmp' to silence this warning
           struct vdpa_link_node *link_head_tmp;
                                               ^
                                                = NULL
>> drivers/vhost/vdpa.c:989:5: warning: no previous prototype for function 'vhost_vdpa_search_range_add' [-Wmissing-prototypes]
   u64 vhost_vdpa_search_range_add(struct rb_root_cached *root, u64 start,
       ^
   drivers/vhost/vdpa.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 vhost_vdpa_search_range_add(struct rb_root_cached *root, u64 start,
   ^
   static 
>> drivers/vhost/vdpa.c:999:5: warning: no previous prototype for function 'vhost_vdpa_search_range_del' [-Wmissing-prototypes]
   u64 vhost_vdpa_search_range_del(struct rb_root_cached *root, u64 start,
       ^
   drivers/vhost/vdpa.c:999:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 vhost_vdpa_search_range_del(struct rb_root_cached *root, u64 start,
   ^
   static 
>> drivers/vhost/vdpa.c:1465:28: warning: no previous prototype for function 'vhost_vdpa_get_mem_tree' [-Wmissing-prototypes]
   struct root_for_vdpa_node *vhost_vdpa_get_mem_tree(struct task_struct *task)
                              ^
   drivers/vhost/vdpa.c:1465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct root_for_vdpa_node *vhost_vdpa_get_mem_tree(struct task_struct *task)
   ^
   static 
>> drivers/vhost/vdpa.c:1493:6: warning: no previous prototype for function 'vhost_vdpa_relase_mem_tree' [-Wmissing-prototypes]
   void vhost_vdpa_relase_mem_tree(struct task_struct *task)
        ^
   drivers/vhost/vdpa.c:1493:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vhost_vdpa_relase_mem_tree(struct task_struct *task)
   ^
   static 
>> drivers/vhost/vdpa.c:1555:29: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           struct root_for_vdpa_node *tmp = vhost_vdpa_get_mem_tree(current);
                                      ^
   16 warnings generated.


vim +/vhost_vdpa_add_range_ctx +555 drivers/vhost/vdpa.c

   554	
 > 555	int vhost_vdpa_add_range_ctx(struct rb_root_cached *root, u64 start, u64 last,
   556				     int ref)
   557	{
   558		struct interval_tree_node *new_node;
   559		struct vdpa_tree_node *vdpa_node;
   560	
   561		if (last < start)
   562			return -EFAULT;
   563	
   564		/* If the range being mapped is [0, ULONG_MAX], split it into two entries
   565		 * otherwise its size would overflow u64.
   566		 */
   567		if (start == 0 && last == ULONG_MAX) {
   568			u64 mid = last / 2;
   569	
   570			vhost_vdpa_add_range_ctx(root, start, mid, ref);
   571			start = mid + 1;
   572		}
   573		vdpa_node = kmalloc(sizeof(struct vdpa_tree_node), GFP_ATOMIC);
   574	
   575		new_node = &vdpa_node->tree_node;
   576		if (!new_node)
   577			return -ENOMEM;
   578	
   579		new_node->start = start;
   580		new_node->last = last;
   581		vdpa_node->ref = ref;
   582	
   583		interval_tree_insert(new_node, root);
   584	
   585		return 0;
   586	}
   587	
 > 588	u64 vhost_vdpa_range_ref_add(struct rb_root_cached *root,
   589				     struct vdpa_link_node *link_head, int node_number,
   590				     u64 start, u64 last)
   591	{
   592		int i = 0;
   593		u64 size = 0;
   594		int new_ref;
   595		u64 node_start;
   596		u64 node_last;
   597		u64 range_start;
   598		u64 range_last;
   599		int range_size;
   600		struct vdpa_link_node *link_node;
   601		struct vdpa_tree_node *vdpa_node = NULL;
   602		struct interval_tree_node *node = NULL;
   603	
   604		if (node_number == 0) {
   605			vhost_vdpa_add_range_ctx(root, start, last, 1);
   606	
   607			size = last - start + 1;
   608			return size;
   609		}
   610	
   611		link_node = link_head;
   612		range_start = start;
   613		range_last = last;
   614		range_size = range_start - range_last;
   615		for (i = 0; i < node_number; i++) {
   616			vdpa_node = link_node->vdpa_node;
   617			link_node = link_node->next;
   618			node = &vdpa_node->tree_node;
   619			new_ref = vdpa_node->ref;
   620			node_start = node->start;
   621			node_last = node->last;
   622	
   623			if (range_start == node_start) {
   624				if (node_last < range_last) {
   625					/* range_start= node->start--- node->last--range_last*/
   626					vhost_vdpa_add_range_ctx(root, node_start,
   627								 node_last,
   628								 new_ref + 1);
   629					/*count the next range */
   630				} else if (node_last > range_last) {
   631					/* range_start= node->start	---  last --  node->last*/
   632					vhost_vdpa_add_range_ctx(root, node_start,
   633								 range_last,
   634								 new_ref + 1);
   635					vhost_vdpa_add_range_ctx(root, range_last + 1,
   636								 node_last, new_ref);
   637				} else {
   638					vhost_vdpa_add_range_ctx(root, node_start,
   639								 node_last,
   640								 new_ref + 1);
   641				}
   642			} else if (node_start < range_start) {
   643				if (range_last < node_last) {
   644					/* node->start---  start--- last--- node->last*/
   645					/* should the end rang*/
   646	
   647					vhost_vdpa_add_range_ctx(root, node_start,
   648								 range_start - 1,
   649								 new_ref);
   650					vhost_vdpa_add_range_ctx(root, range_start,
   651								 range_last,
   652								 new_ref + 1);
   653					vhost_vdpa_add_range_ctx(root, range_last + 1,
   654								 node_last, new_ref);
   655	
   656				} else if (range_last > node_last) {
   657					/* node->start---  start--- node->last-- last*/
   658	
   659					vhost_vdpa_add_range_ctx(root, node_start,
   660								 range_start - 1,
   661								 new_ref);
   662					vhost_vdpa_add_range_ctx(root, range_start,
   663								 node_last,
   664								 new_ref + 1);
   665				} else {
   666					/* node->start---  start--- node->last= last*/
   667					vhost_vdpa_add_range_ctx(root, node_start,
   668								 range_start - 1,
   669								 new_ref);
   670					vhost_vdpa_add_range_ctx(root, range_start,
   671								 node_last,
   672								 new_ref + 1);
   673					/* should the end rang*/
   674				}
   675			} else {
   676				if (node_last < range_last) {
   677					/* range_start --- node->start --- node->last ----last  */
   678	
   679					vhost_vdpa_add_range_ctx(root, range_start,
   680								 node_start - 1, 1);
   681					vhost_vdpa_add_range_ctx(root, node_start,
   682								 node_last,
   683								 new_ref + 1);
   684					size += ((node_start - 1) - range_start) + 1;
   685				} else if (node_last > range_last) {
   686					/* range_start--- node->start	---  last --  node->last	*/
   687					vhost_vdpa_add_range_ctx(root, range_start,
   688								 node_start - 1, 1);
   689					vhost_vdpa_add_range_ctx(root, node_start,
   690								 range_last,
   691								 new_ref + 1);
   692					vhost_vdpa_add_range_ctx(root, range_last + 1,
   693								 node_last, new_ref);
   694					size += ((node_start - 1) - range_start) + 1;
   695	
   696					/* should the end rang*/
   697				} else {
   698					/* range_start--- node->start	---  last =  node->last	*/
   699					vhost_vdpa_add_range_ctx(root, range_start,
   700								 node_start - 1, 1);
   701					vhost_vdpa_add_range_ctx(root, node_start,
   702								 node_last,
   703								 new_ref + 1);
   704					size += ((node_start - 1) - range_start) + 1;
   705	
   706					/* should the end rang*/
   707				}
   708			}
   709			/* work in next node*/
   710			range_start = node_last + 1;
   711			if (range_start > range_last)
   712				break;
   713		}
   714	
   715		range_size = range_last - range_start;
   716	
   717		/* last round and still some range*/
   718	
   719		if ((range_size >= 0) && (range_start >= node_last) &&
   720		    (node_number == i + 1)) {
   721			vhost_vdpa_add_range_ctx(root, range_start, range_last, 1);
   722			size = size + (range_last - range_start) + 1;
   723		} else if ((range_size == -1) && (node_number == i + 1)) {
   724			return size;
   725		} else {
   726			printk(KERN_WARNING,
 > 727			       "%s %d FAIL start %lld last %lld node->start %lld  node->last %lld i  %d",
   728			       __func__, __LINE__, range_start, range_last, node_start,
   729			       node_last, i);
   730		}
   731	
   732		return size;
   733	}
   734	
 > 735	u64 vhost_vdpa_range_ref_del(struct rb_root_cached *root,
   736				     struct vdpa_link_node *link_head, int node_number,
   737				     u64 start, u64 last)
   738	{
   739		int i = 0;
   740		u64 size = 0;
   741		int new_ref;
   742		u64 node_start;
   743		u64 node_last;
   744		u64 range_start;
   745		u64 range_last;
   746		int range_size;
   747		struct vdpa_link_node *link_node;
   748		struct vdpa_tree_node *vdpa_node = NULL;
   749		struct interval_tree_node *node = NULL;
   750	
   751		if (node_number == 0)
   752			return 0;
   753	
   754		link_node = link_head;
   755		range_start = start;
   756		range_last = last;
   757	
   758		for (i = 0; i < node_number; i++) {
   759			vdpa_node = link_node->vdpa_node;
   760			link_node = link_node->next;
   761			node = &vdpa_node->tree_node;
   762			new_ref = vdpa_node->ref;
   763			node_start = node->start;
   764			node_last = node->last;
   765	
   766			if (range_start == node_start) {
   767				if (node_last < range_last) {
   768					/* range_start =node->start --- node->last ----last*/
   769					if (new_ref > 1) {
   770						vhost_vdpa_add_range_ctx(root,
   771									 node_start,
   772									 node_last,
   773									 new_ref - 1);
   774						/*count the next range */
   775					} else {
   776						/* if the ref =0, do not need add it back, count size*/
   777						size += (node_last - node_start) + 1;
   778					}
   779	
   780				} else if (node_last > range_last) {
   781					/* range_start= node->start	---  last --  node->last*/
   782	
   783					if (new_ref > 1) {
   784						vhost_vdpa_add_range_ctx(root,
   785									 node_start,
   786									 range_last,
   787									 new_ref - 1);
   788					} else {
   789						size += (range_last - node_start) + 1;
   790					}
   791					vhost_vdpa_add_range_ctx(root, range_last + 1,
   792								 node_last, new_ref);
   793				} else {
   794					/* range_start= node->start	---  last = node->last*/
   795	
   796					if (new_ref > 1) {
   797						vhost_vdpa_add_range_ctx(root,
   798									 node_start,
   799									 range_last,
   800									 new_ref - 1);
   801					} else {
   802						size += (range_last - node_start) + 1;
   803					}
   804					/* should be the end */
   805				}
   806			} else if (node_start < range_start) {
   807				if (range_last < node_last) {
   808					/* node->start---  start--- last--- node->last*/
   809					/* should the end rang*/
   810					vhost_vdpa_add_range_ctx(root, node_start,
   811								 range_start - 1,
   812								 new_ref);
   813					if (new_ref > 1) {
   814						vhost_vdpa_add_range_ctx(root,
   815									 range_start,
   816									 range_last,
   817									 new_ref - 1);
   818					} else {
   819						size += (range_last - range_start) + 1;
   820					}
   821					vhost_vdpa_add_range_ctx(root, range_last + 1,
   822								 node_last, new_ref);
   823	
   824				} else if (range_last > node_last) {
   825					/* node->start---  start--- node->last--- last*/
   826	
   827					vhost_vdpa_add_range_ctx(root, node_start,
   828								 range_start - 1,
   829								 new_ref);
   830					if (new_ref > 1) {
   831						vhost_vdpa_add_range_ctx(root,
   832									 range_start,
   833									 node_last,
   834									 new_ref - 1);
   835					} else {
   836						size += (node_last - range_start) + 1;
   837					}
   838				} else {
   839					/* node->start---  start--- node->last= last*/
   840					vhost_vdpa_add_range_ctx(root, node_start,
   841								 range_start - 1,
   842								 new_ref);
   843					if (new_ref > 1) {
   844						vhost_vdpa_add_range_ctx(root,
   845									 range_start,
   846									 range_last,
   847									 new_ref - 1);
   848					} else {
   849						size += (range_last - range_start) + 1;
   850					}
   851					/* should be the end */
   852				}
   853			} else {
   854				/* some range not in the node, error*/
   855				printk(KERN_WARNING,
   856				       "%s %d FAIL  start %lld last %lld node->start %lld  node->last %lld new_ref %d",
   857				       __func__, __LINE__, range_start, range_last,
   858				       node_start, node_last, new_ref);
   859			}
   860	
   861			range_start = node_last + 1;
   862			if (range_start > range_last)
   863				break;
   864		}
   865	
   866		range_size = range_last - range_start;
   867	
   868		/* last round and still some range*/
   869	
   870		if ((range_size > 0) && (node_number == i + 1)) {
   871			printk(KERN_WARNING,
   872			       "%s %d FAIL start %lld last %lld node->start %lld  node->last %lld range_size  %d",
   873			       __func__, __LINE__, range_start, range_last, node_start,
   874			       node_last, range_size);
   875		}
   876		return size;
   877	}
   878	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
