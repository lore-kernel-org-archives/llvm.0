Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F911810
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653396034; x=1684932034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ujGDC3gZBPPlgl0rf1pk/PvTcQi9ZaZDeARwuoJNaFI=;
  b=Umzf1HaovvPVEIrKTlvA8rtepQP42enuiu3DevqdFhu52vtn0oJaOfyx
   59P2QlvVGqVhPXQYfYtrBAwi6Oh+4fUOUtwkjVX/o7J//dI3jKdOUz5rS
   ef8L4ks4zzp5eNEKG3A/AHQUUZq15poTxgYimszlBEnmn53MwA6hSQdl4
   dvZUr+TLOaNrOF4BRsxr7BbFXeBlBkz3PuTd+JtPTestZ10BiGtzjpNJg
   J0ZvRamL0rxULXSXO9wp9rXsJ1g8UIfEeY7ySiBm17d+p8NK4gzjTjcZz
   QwTEKoQwo8nbrN0uwcL30cF35a5RdparQfiB/Dboo0J+dTlR6tRcwXpjB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273244162"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="273244162"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="703453006"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 May 2022 05:40:32 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntTpv-00021u-Gr;
	Tue, 24 May 2022 12:40:31 +0000
Date: Tue, 24 May 2022 20:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC net-next] net/smc:introduce 1RTT to SMC
Message-ID: <202205242056.SUbsT3nP-lkp@intel.com>
References: <1653375127-130233-1-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653375127-130233-1-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe",

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-introduce-1RTT-to-SMC/20220524-145404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 677fb7525331375ba2f90f4bc94a80b9b6e697a3
config: mips-randconfig-r014-20220524 (https://download.01.org/0day-ci/archive/20220524/202205242056.SUbsT3nP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4658b14876ebb1577289bd0bc4c2b7fccd1af486
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review D-Wythe/net-smc-introduce-1RTT-to-SMC/20220524-145404
        git checkout 4658b14876ebb1577289bd0bc4c2b7fccd1af486
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/smc/smc_clc.c:805:5: warning: no previous prototype for function 'smc_clc_send_proposal_with_nexthop' [-Wmissing-prototypes]
   int smc_clc_send_proposal_with_nexthop(struct smc_sock *smc,
       ^
   net/smc/smc_clc.c:805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int smc_clc_send_proposal_with_nexthop(struct smc_sock *smc,
   ^
   static 
   1 warning generated.


vim +/smc_clc_send_proposal_with_nexthop +805 net/smc/smc_clc.c

   803	
   804	/* send CLC PROPOSAL message across internal TCP socket */
 > 805	int smc_clc_send_proposal_with_nexthop(struct smc_sock *smc,
   806					       struct dst_entry *dst, struct smc_init_info *ini)
   807	{
   808		struct smc_clc_smcd_v2_extension *smcd_v2_ext;
   809		struct smc_clc_msg_proposal_prefix *pclc_prfx;
   810		struct smc_clc_msg_proposal *pclc_base;
   811		struct smc_clc_smcd_gid_chid *gidchids;
   812		struct smc_clc_msg_proposal_area *pclc;
   813		struct smc_clc_ipv6_prefix *ipv6_prfx;
   814		struct smc_clc_v2_extension *v2_ext;
   815		struct smc_clc_msg_smcd *pclc_smcd;
   816		struct smc_clc_msg_trail *trl;
   817		int len, i, plen, rc;
   818		int reason_code = 0;
   819		struct kvec vec[8];
   820		struct msghdr msg;
   821	
   822		pclc = kzalloc(sizeof(*pclc), GFP_KERNEL);
   823		if (!pclc)
   824			return -ENOMEM;
   825	
   826		pclc_base = &pclc->pclc_base;
   827		pclc_smcd = &pclc->pclc_smcd;
   828		pclc_prfx = &pclc->pclc_prfx;
   829		ipv6_prfx = pclc->pclc_prfx_ipv6;
   830		v2_ext = &pclc->pclc_v2_ext;
   831		smcd_v2_ext = &pclc->pclc_smcd_v2_ext;
   832		gidchids = pclc->pclc_gidchids;
   833		trl = &pclc->pclc_trl;
   834	
   835		pclc_base->hdr.version = SMC_V2;
   836		pclc_base->hdr.typev1 = ini->smc_type_v1;
   837		pclc_base->hdr.typev2 = ini->smc_type_v2;
   838		plen = sizeof(*pclc_base) + sizeof(*pclc_smcd) + sizeof(*trl);
   839	
   840		/* retrieve ip prefixes for CLC proposal msg */
   841		if (ini->smc_type_v1 != SMC_TYPE_N) {
   842			rc = smc_clc_prfx_set(smc->clcsock, dst, pclc_prfx, ipv6_prfx);
   843			if (rc) {
   844				if (ini->smc_type_v2 == SMC_TYPE_N) {
   845					kfree(pclc);
   846					return SMC_CLC_DECL_CNFERR;
   847				}
   848				pclc_base->hdr.typev1 = SMC_TYPE_N;
   849			} else {
   850				pclc_base->iparea_offset = htons(sizeof(*pclc_smcd));
   851				plen += sizeof(*pclc_prfx) +
   852						pclc_prfx->ipv6_prefixes_cnt *
   853						sizeof(ipv6_prfx[0]);
   854			}
   855		}
   856	
   857		/* build SMC Proposal CLC message */
   858		memcpy(pclc_base->hdr.eyecatcher, SMC_EYECATCHER,
   859		       sizeof(SMC_EYECATCHER));
   860		pclc_base->hdr.type = SMC_CLC_PROPOSAL;
   861		if (smcr_indicated(ini->smc_type_v1)) {
   862			/* add SMC-R specifics */
   863			memcpy(pclc_base->lcl.id_for_peer, local_systemid,
   864			       sizeof(local_systemid));
   865			memcpy(pclc_base->lcl.gid, ini->ib_gid, SMC_GID_SIZE);
   866			memcpy(pclc_base->lcl.mac, &ini->ib_dev->mac[ini->ib_port - 1],
   867			       ETH_ALEN);
   868		}
   869		if (smcd_indicated(ini->smc_type_v1)) {
   870			/* add SMC-D specifics */
   871			if (ini->ism_dev[0]) {
   872				pclc_smcd->ism.gid = htonll(ini->ism_dev[0]->local_gid);
   873				pclc_smcd->ism.chid =
   874					htons(smc_ism_get_chid(ini->ism_dev[0]));
   875			}
   876		}
   877		if (ini->smc_type_v2 == SMC_TYPE_N) {
   878			pclc_smcd->v2_ext_offset = 0;
   879		} else {
   880			struct smc_clc_eid_entry *ueident;
   881			u16 v2_ext_offset;
   882	
   883			v2_ext->hdr.flag.release = SMC_RELEASE;
   884			v2_ext_offset = sizeof(*pclc_smcd) -
   885				offsetofend(struct smc_clc_msg_smcd, v2_ext_offset);
   886			if (ini->smc_type_v1 != SMC_TYPE_N)
   887				v2_ext_offset += sizeof(*pclc_prfx) +
   888							pclc_prfx->ipv6_prefixes_cnt *
   889							sizeof(ipv6_prfx[0]);
   890			pclc_smcd->v2_ext_offset = htons(v2_ext_offset);
   891			plen += sizeof(*v2_ext);
   892	
   893			read_lock(&smc_clc_eid_table.lock);
   894			v2_ext->hdr.eid_cnt = smc_clc_eid_table.ueid_cnt;
   895			plen += smc_clc_eid_table.ueid_cnt * SMC_MAX_EID_LEN;
   896			i = 0;
   897			list_for_each_entry(ueident, &smc_clc_eid_table.list, list) {
   898				memcpy(v2_ext->user_eids[i++], ueident->eid,
   899				       sizeof(ueident->eid));
   900			}
   901			read_unlock(&smc_clc_eid_table.lock);
   902		}
   903		if (smcd_indicated(ini->smc_type_v2)) {
   904			u8 *eid = NULL;
   905	
   906			v2_ext->hdr.flag.seid = smc_clc_eid_table.seid_enabled;
   907			v2_ext->hdr.ism_gid_cnt = ini->ism_offered_cnt;
   908			v2_ext->hdr.smcd_v2_ext_offset = htons(sizeof(*v2_ext) -
   909					offsetofend(struct smc_clnt_opts_area_hdr,
   910						    smcd_v2_ext_offset) +
   911					v2_ext->hdr.eid_cnt * SMC_MAX_EID_LEN);
   912			smc_ism_get_system_eid(&eid);
   913			if (eid && v2_ext->hdr.flag.seid)
   914				memcpy(smcd_v2_ext->system_eid, eid, SMC_MAX_EID_LEN);
   915			plen += sizeof(*smcd_v2_ext);
   916			if (ini->ism_offered_cnt) {
   917				for (i = 1; i <= ini->ism_offered_cnt; i++) {
   918					gidchids[i - 1].gid =
   919						htonll(ini->ism_dev[i]->local_gid);
   920					gidchids[i - 1].chid =
   921						htons(smc_ism_get_chid(ini->ism_dev[i]));
   922				}
   923				plen += ini->ism_offered_cnt *
   924					sizeof(struct smc_clc_smcd_gid_chid);
   925			}
   926		}
   927		if (smcr_indicated(ini->smc_type_v2))
   928			memcpy(v2_ext->roce, ini->smcrv2.ib_gid_v2, SMC_GID_SIZE);
   929	
   930		pclc_base->hdr.length = htons(plen);
   931		memcpy(trl->eyecatcher, SMC_EYECATCHER, sizeof(SMC_EYECATCHER));
   932	
   933		/* send SMC Proposal CLC message */
   934		memset(&msg, 0, sizeof(msg));
   935		i = 0;
   936		vec[i].iov_base = pclc_base;
   937		vec[i++].iov_len = sizeof(*pclc_base);
   938		vec[i].iov_base = pclc_smcd;
   939		vec[i++].iov_len = sizeof(*pclc_smcd);
   940		if (ini->smc_type_v1 != SMC_TYPE_N) {
   941			vec[i].iov_base = pclc_prfx;
   942			vec[i++].iov_len = sizeof(*pclc_prfx);
   943			if (pclc_prfx->ipv6_prefixes_cnt > 0) {
   944				vec[i].iov_base = ipv6_prfx;
   945				vec[i++].iov_len = pclc_prfx->ipv6_prefixes_cnt *
   946						   sizeof(ipv6_prfx[0]);
   947			}
   948		}
   949		if (ini->smc_type_v2 != SMC_TYPE_N) {
   950			vec[i].iov_base = v2_ext;
   951			vec[i++].iov_len = sizeof(*v2_ext) +
   952					   (v2_ext->hdr.eid_cnt * SMC_MAX_EID_LEN);
   953			if (smcd_indicated(ini->smc_type_v2)) {
   954				vec[i].iov_base = smcd_v2_ext;
   955				vec[i++].iov_len = sizeof(*smcd_v2_ext);
   956				if (ini->ism_offered_cnt) {
   957					vec[i].iov_base = gidchids;
   958					vec[i++].iov_len = ini->ism_offered_cnt *
   959						sizeof(struct smc_clc_smcd_gid_chid);
   960				}
   961			}
   962		}
   963		vec[i].iov_base = trl;
   964		vec[i++].iov_len = sizeof(*trl);
   965	
   966		msg.msg_flags	|= MSG_FASTOPEN;
   967		msg.msg_name	= &smc->remote_address.addr;
   968		msg.msg_namelen = sizeof(struct sockaddr_in);
   969	
   970		/* due to the few bytes needed for clc-handshake this cannot block */
   971		len = kernel_sendmsg(smc->clcsock, &msg, vec, i, plen);
   972		if (len < 0) {
   973			smc->sk.sk_err = smc->clcsock->sk->sk_err;
   974			reason_code = -smc->sk.sk_err;
   975		} else if (len < ntohs(pclc_base->hdr.length)) {
   976			reason_code = -ENETUNREACH;
   977			smc->sk.sk_err = -reason_code;
   978		}
   979	
   980		kfree(pclc);
   981		return reason_code;
   982	}
   983	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
