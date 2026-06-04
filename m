Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3CC3BE156;
	Thu,  4 Jun 2026 18:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599486; cv=none; b=OxJIFjjqGr8PnlmZBBzSFl8PBpgGHecawwN5wAgxDAS+dHP5soVSDzAz33CpluwI5K/IdSlmWmtgpaEyYj8HJN5pUKTyoLiHQEXw9xWJ/2U+9uYcBnPBk7FqTSSguZCrPh5IChN/aCVBRkq/GeTzI7+mtBzzfVIqqiXH75xmYAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599486; c=relaxed/simple;
	bh=gKVM05PNr8R2XNmO5MpUrWmS5iLLPUF6nxK9hVTJnZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Je5xU9+aJiTnJUvw5ewjqAQjDa9XLX+QG/L7xwd8JqmWNpuFOEVhNjlKfuDyWttULhC2CYKYXOfcmRiALzPw3P8MxfkJu0/pXdm0E1FDJ11AU2PCBGify9SrJFSob8dTL7YIuL2H/WnjPQjUkHJVCUzqlS04v+cuEryXaHl68UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyRH0OqP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyRH0OqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780599484; x=1812135484;
  h=date:from:to:cc:subject:message-id;
  bh=gKVM05PNr8R2XNmO5MpUrWmS5iLLPUF6nxK9hVTJnZI=;
  b=nyRH0OqP1LdSF/0AW4EFuAIRASXFbXG5z93z5IfHBclomS5GCjSctrSd
   P8PTmSx1UfsQvjODTOv3WjvwaJdhObaCdgm7PyWXdmzlocJ/Rj8GJ6x5f
   qVbwYrDMI4oHqhxjRozPGHB8clR53CoyWtdPHxNE1LsykOuJlfPXFxHG0
   jjB1OTedQzFUkWou8ICPHZmoHpql2xZkfDFEnhdpcZtifhWS59A35+a8G
   vLqLNynywQpz8kG0LC85O6nF4sAhAd2bi53aju1s2i+jA/4B+dvuGEHmZ
   EyWpEYeKDQy7p7NpUORiKq0vCxF6bHm1omc71ju8exrlFEBDhw4PJZw+j
   w==;
X-CSE-ConnectionGUID: hTzbQRyqQ3eoO1hRu4Srfg==
X-CSE-MsgGUID: VD115MttSf6JKNpzSICtIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92807121"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="92807121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 11:58:02 -0700
X-CSE-ConnectionGUID: 0hmdwXd+SDCpsSkbGBbEgg==
X-CSE-MsgGUID: wsWR3ZnvRs6CY1oACA4kKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="249550557"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 11:58:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVDGQ-00000000F5q-2kAW;
	Thu, 04 Jun 2026 18:57:58 +0000
Date: Fri, 05 Jun 2026 02:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 29/31] net/ipv4/sysctl_net_ipv4.c:648:11:
 error: no member named 'sysctl_fib_multipath_hash_fields' in 'struct
 netns_ipv4'
Message-ID: <202606050236.pCpSqVbd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: ed699fdc856ea36d4d96deb3905ebf7c90b86305 [29/31] sysctl: use ctl_field in IPv4 netns sysctls
config: powerpc64-randconfig-001-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050236.pCpSqVbd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050236.pCpSqVbd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050236.pCpSqVbd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ipv4/sysctl_net_ipv4.c:648:11: error: no member named 'sysctl_fib_multipath_hash_fields' in 'struct netns_ipv4'
     648 | IPV4_DATA(sysctl_fib_multipath_hash_fields)
         | ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:645:31: note: expanded from macro 'IPV4_DATA'
     645 |         return &ctx->ns.net_ns->ipv4.field;                             \
         |                 ~~~~~~~~~~~~~~~~~~~~ ^
>> net/ipv4/sysctl_net_ipv4.c:649:11: error: no member named 'sysctl_fib_multipath_hash_policy' in 'struct netns_ipv4'
     649 | IPV4_DATA(sysctl_fib_multipath_hash_policy)
         | ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:645:31: note: expanded from macro 'IPV4_DATA'
     645 |         return &ctx->ns.net_ns->ipv4.field;                             \
         |                 ~~~~~~~~~~~~~~~~~~~~ ^
>> net/ipv4/sysctl_net_ipv4.c:650:11: error: no member named 'sysctl_fib_multipath_use_neigh' in 'struct netns_ipv4'
     650 | IPV4_DATA(sysctl_fib_multipath_use_neigh)
         | ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:645:31: note: expanded from macro 'IPV4_DATA'
     645 |         return &ctx->ns.net_ns->ipv4.field;                             \
         |                 ~~~~~~~~~~~~~~~~~~~~ ^
   3 errors generated.


vim +648 net/ipv4/sysctl_net_ipv4.c

   647	
 > 648	IPV4_DATA(sysctl_fib_multipath_hash_fields)
 > 649	IPV4_DATA(sysctl_fib_multipath_hash_policy)
 > 650	IPV4_DATA(sysctl_fib_multipath_use_neigh)
   651	IPV4_DATA(sysctl_fib_notify_on_flag_change)
   652	IPV4_DATA(sysctl_fwmark_reflect)
   653	IPV4_DATA(sysctl_icmp_echo_enable_probe)
   654	IPV4_DATA(sysctl_icmp_echo_ignore_all)
   655	IPV4_DATA(sysctl_icmp_echo_ignore_broadcasts)
   656	IPV4_DATA(sysctl_icmp_errors_extension_mask)
   657	IPV4_DATA(sysctl_icmp_errors_use_inbound_ifaddr)
   658	IPV4_DATA(sysctl_icmp_ignore_bogus_error_responses)
   659	IPV4_DATA(sysctl_icmp_msgs_burst)
   660	IPV4_DATA(sysctl_icmp_msgs_per_sec)
   661	IPV4_DATA(sysctl_icmp_ratelimit)
   662	IPV4_DATA(sysctl_icmp_ratemask)
   663	IPV4_DATA(sysctl_igmp_llm_reports)
   664	IPV4_DATA(sysctl_igmp_max_memberships)
   665	IPV4_DATA(sysctl_igmp_max_msf)
   666	IPV4_DATA(sysctl_igmp_qrv)
   667	IPV4_DATA(sysctl_ip_autobind_reuse)
   668	IPV4_DATA(sysctl_ip_default_ttl)
   669	IPV4_DATA(sysctl_ip_dynaddr)
   670	IPV4_DATA(sysctl_ip_early_demux)
   671	IPV4_DATA(sysctl_ip_fwd_update_priority)
   672	IPV4_DATA(sysctl_ip_fwd_use_pmtu)
   673	IPV4_DATA(sysctl_ip_local_port_step_width)
   674	IPV4_DATA(sysctl_ip_no_pmtu_disc)
   675	IPV4_DATA(sysctl_ip_nonlocal_bind)
   676	IPV4_DATA(sysctl_ip_prot_sock)
   677	IPV4_DATA(sysctl_local_reserved_ports)
   678	IPV4_DATA(sysctl_max_syn_backlog)
   679	IPV4_DATA(sysctl_nexthop_compat_mode)
   680	#ifdef CONFIG_NET_L3_MASTER_DEV
   681	IPV4_DATA(sysctl_raw_l3mdev_accept)
   682	#endif
   683	IPV4_DATA(sysctl_tcp_abort_on_overflow)
   684	IPV4_DATA(sysctl_tcp_adv_win_scale)
   685	IPV4_DATA(sysctl_tcp_app_win)
   686	IPV4_DATA(sysctl_tcp_autocorking)
   687	IPV4_DATA(sysctl_tcp_backlog_ack_defer)
   688	IPV4_DATA(sysctl_tcp_base_mss)
   689	IPV4_DATA(sysctl_tcp_challenge_ack_limit)
   690	IPV4_DATA(sysctl_tcp_child_ehash_entries)
   691	IPV4_DATA(sysctl_tcp_comp_sack_delay_ns)
   692	IPV4_DATA(sysctl_tcp_comp_sack_nr)
   693	IPV4_DATA(sysctl_tcp_comp_sack_rtt_percent)
   694	IPV4_DATA(sysctl_tcp_comp_sack_slack_ns)
   695	IPV4_DATA(sysctl_tcp_dsack)
   696	IPV4_DATA(sysctl_tcp_early_demux)
   697	IPV4_DATA(sysctl_tcp_early_retrans)
   698	IPV4_DATA(sysctl_tcp_ecn)
   699	IPV4_DATA(sysctl_tcp_ecn_fallback)
   700	IPV4_DATA(sysctl_tcp_ecn_option)
   701	IPV4_DATA(sysctl_tcp_ecn_option_beacon)
   702	IPV4_DATA(sysctl_tcp_fack)
   703	IPV4_DATA(sysctl_tcp_fastopen)
   704	IPV4_DATA(sysctl_tcp_fastopen_blackhole_timeout)
   705	IPV4_DATA(sysctl_tcp_fin_timeout)
   706	IPV4_DATA(sysctl_tcp_frto)
   707	IPV4_DATA(sysctl_tcp_fwmark_accept)
   708	IPV4_DATA(sysctl_tcp_invalid_ratelimit)
   709	IPV4_DATA(sysctl_tcp_keepalive_intvl)
   710	IPV4_DATA(sysctl_tcp_keepalive_probes)
   711	IPV4_DATA(sysctl_tcp_keepalive_time)
   712	#ifdef CONFIG_NET_L3_MASTER_DEV
   713	IPV4_DATA(sysctl_tcp_l3mdev_accept)
   714	#endif
   715	IPV4_DATA(sysctl_tcp_limit_output_bytes)
   716	IPV4_DATA(sysctl_tcp_max_reordering)
   717	IPV4_DATA(sysctl_tcp_migrate_req)
   718	IPV4_DATA(sysctl_tcp_min_rtt_wlen)
   719	IPV4_DATA(sysctl_tcp_min_snd_mss)
   720	IPV4_DATA(sysctl_tcp_min_tso_segs)
   721	IPV4_DATA(sysctl_tcp_moderate_rcvbuf)
   722	IPV4_DATA(sysctl_tcp_mtu_probe_floor)
   723	IPV4_DATA(sysctl_tcp_mtu_probing)
   724	IPV4_DATA(sysctl_tcp_no_ssthresh_metrics_save)
   725	IPV4_DATA(sysctl_tcp_nometrics_save)
   726	IPV4_DATA(sysctl_tcp_notsent_lowat)
   727	IPV4_DATA(sysctl_tcp_orphan_retries)
   728	IPV4_DATA(sysctl_tcp_pacing_ca_ratio)
   729	IPV4_DATA(sysctl_tcp_pacing_ss_ratio)
   730	IPV4_DATA(sysctl_tcp_pingpong_thresh)
   731	IPV4_DATA(sysctl_tcp_plb_cong_thresh)
   732	IPV4_DATA(sysctl_tcp_plb_enabled)
   733	IPV4_DATA(sysctl_tcp_plb_idle_rehash_rounds)
   734	IPV4_DATA(sysctl_tcp_plb_rehash_rounds)
   735	IPV4_DATA(sysctl_tcp_plb_suspend_rto_sec)
   736	IPV4_DATA(sysctl_tcp_probe_interval)
   737	IPV4_DATA(sysctl_tcp_probe_threshold)
   738	IPV4_DATA(sysctl_tcp_rcvbuf_low_rtt)
   739	IPV4_DATA(sysctl_tcp_recovery)
   740	IPV4_DATA(sysctl_tcp_reflect_tos)
   741	IPV4_DATA(sysctl_tcp_reordering)
   742	IPV4_DATA(sysctl_tcp_retrans_collapse)
   743	IPV4_DATA(sysctl_tcp_retries1)
   744	IPV4_DATA(sysctl_tcp_retries2)
   745	IPV4_DATA(sysctl_tcp_rfc1337)
   746	IPV4_DATA(sysctl_tcp_rmem)
   747	IPV4_DATA(sysctl_tcp_rto_max_ms)
   748	IPV4_DATA(sysctl_tcp_rto_min_us)
   749	IPV4_DATA(sysctl_tcp_sack)
   750	IPV4_DATA(sysctl_tcp_shrink_window)
   751	IPV4_DATA(sysctl_tcp_slow_start_after_idle)
   752	IPV4_DATA(sysctl_tcp_stdurg)
   753	IPV4_DATA(sysctl_tcp_syn_linear_timeouts)
   754	IPV4_DATA(sysctl_tcp_syn_retries)
   755	IPV4_DATA(sysctl_tcp_synack_retries)
   756	IPV4_DATA(sysctl_tcp_syncookies)
   757	IPV4_DATA(sysctl_tcp_thin_linear_timeouts)
   758	IPV4_DATA(sysctl_tcp_timestamps)
   759	IPV4_DATA(sysctl_tcp_tso_rtt_log)
   760	IPV4_DATA(sysctl_tcp_tso_win_divisor)
   761	IPV4_DATA(sysctl_tcp_tw_reuse)
   762	IPV4_DATA(sysctl_tcp_tw_reuse_delay)
   763	IPV4_DATA(sysctl_tcp_window_scaling)
   764	IPV4_DATA(sysctl_tcp_wmem)
   765	IPV4_DATA(sysctl_tcp_workaround_signed_windows)
   766	IPV4_DATA(sysctl_udp_child_hash_entries)
   767	IPV4_DATA(sysctl_udp_early_demux)
   768	#ifdef CONFIG_NET_L3_MASTER_DEV
   769	IPV4_DATA(sysctl_udp_l3mdev_accept)
   770	#endif
   771	IPV4_DATA(sysctl_udp_rmem_min)
   772	IPV4_DATA(sysctl_udp_wmem_min)
   773	IPV4_DATA(tcp_congestion_control)
   774	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
