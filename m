Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C7D1D63C4;
	Tue, 17 Dec 2024 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423394; cv=none; b=VRHukPmUaLqIQiwUFOW+BHWNwdtYNdNOwZ3i57Itf8+tlaCJnbroSWzsPH/Dgc8I3ngss7wRktxHxBhw19yDH2Jg1uHCyMvnDE67e+GQhd3onmV7ykZOUdXj7Fe9xw51f5NpIp9Nwg/SNE8I7P3VYnq/LuRoZ/+WUnc9ikU8p+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423394; c=relaxed/simple;
	bh=s/ei+f1zrQkRIi7JkX+WLhNE0dT0w8YQOff7Qh9X/TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DobWG5BuGXsPbEguWjmPRsL8NFSo1lsgJQiSBlo7Rw9+uXHvcsk6WxeTIFQXuJ7EtV9SH/8PhXFBfJJpPioMh+Z4jjcfblGynbKqcSGskW22eu15m06vJPqxjC/kpAMhK3G7bhiaSud05hyUZ8Ub1NnPknTlTZDFdBcNegmewpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZoa5OZN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZoa5OZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423392; x=1765959392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/ei+f1zrQkRIi7JkX+WLhNE0dT0w8YQOff7Qh9X/TA=;
  b=VZoa5OZNakMrPnUoEeeIAnTisMfkK8kDmvQhDA+7nkLyuPQHL0pWa1+H
   QSVAJmpZRLHhoUqJB9BHWcYe+ALVEX8K61GyS+LrMrqFkvs7VoB8T57Zj
   dDRHteh2IPq381V0ccNn7WBrrnB6450b+kss5zDZMExhuVWQ1YzKCLL61
   piuwyasqxzf9fbYQte31orxhtGqk5PSyqmRgj+0mry++EPYV86Si8Hvfn
   2stL0abuhYSoZ9nvEiiphMtcJlaWn8pUsw8eFAPXb6l1A6bhOmCKlbmSS
   vGrez7L4yooOs+bbKSyY7E74yNTeuoPy3HfmtIzbkj2Ktty6RX9UFgpW4
   Q==;
X-CSE-ConnectionGUID: RREQD39zSwS2cJvLdGX+zA==
X-CSE-MsgGUID: s22Lss8mTYuJGFXwAcgp2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22427648"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="22427648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:16:30 -0800
X-CSE-ConnectionGUID: 49Kao/xiQFeqFB7qx+P8JQ==
X-CSE-MsgGUID: YMoj1RNBTCupPTQNVBhYlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101608899"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2024 00:16:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSkg-000EpQ-0t;
	Tue, 17 Dec 2024 08:16:22 +0000
Date: Tue, 17 Dec 2024 16:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Greenwalt <paul.greenwalt@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v5] ice: Add E830 checksum
 offload support
Message-ID: <202412171627.IkiDlzsr-lkp@intel.com>
References: <20241216173212.1157855-1-paul.greenwalt@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216173212.1157855-1-paul.greenwalt@intel.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Greenwalt/ice-Add-E830-checksum-offload-support/20241217-092509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20241216173212.1157855-1-paul.greenwalt%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v5] ice: Add E830 checksum offload support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241217/202412171627.IkiDlzsr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171627.IkiDlzsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171627.IkiDlzsr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_txrx.c:6:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_txrx.c:1917:30: error: too few arguments provided to function-like macro invocation
    1917 |                                         ICE_TX_GCS_DESC_CSUM_PSH);
         |                                                                 ^
   include/linux/bitfield.h:113:9: note: macro 'FIELD_PREP' defined here
     113 | #define FIELD_PREP(_mask, _val)                                         \
         |         ^
>> drivers/net/ethernet/intel/ice/ice_txrx.c:1916:9: error: use of undeclared identifier 'FIELD_PREP'
    1916 |                              FIELD_PREP(ICE_TX_GCS_DESC_TYPE_M |
         |                              ^
   4 warnings and 2 errors generated.


vim +1917 drivers/net/ethernet/intel/ice/ice_txrx.c

  1745	
  1746	/**
  1747	 * ice_tx_csum - Enable Tx checksum offloads
  1748	 * @first: pointer to the first descriptor
  1749	 * @off: pointer to struct that holds offload parameters
  1750	 *
  1751	 * Returns 0 or error (negative) if checksum offload can't happen, 1 otherwise.
  1752	 */
  1753	static
  1754	int ice_tx_csum(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
  1755	{
  1756		const struct ice_tx_ring *tx_ring = off->tx_ring;
  1757		u32 l4_len = 0, l3_len = 0, l2_len = 0;
  1758		struct sk_buff *skb = first->skb;
  1759		union {
  1760			struct iphdr *v4;
  1761			struct ipv6hdr *v6;
  1762			unsigned char *hdr;
  1763		} ip;
  1764		union {
  1765			struct tcphdr *tcp;
  1766			unsigned char *hdr;
  1767		} l4;
  1768		__be16 frag_off, protocol;
  1769		unsigned char *exthdr;
  1770		u32 offset, cmd = 0;
  1771		u8 l4_proto = 0;
  1772	
  1773		if (skb->ip_summed != CHECKSUM_PARTIAL)
  1774			return 0;
  1775	
  1776		protocol = vlan_get_protocol(skb);
  1777	
  1778		if (eth_p_mpls(protocol)) {
  1779			ip.hdr = skb_inner_network_header(skb);
  1780			l4.hdr = skb_checksum_start(skb);
  1781		} else {
  1782			ip.hdr = skb_network_header(skb);
  1783			l4.hdr = skb_transport_header(skb);
  1784		}
  1785	
  1786		/* compute outer L2 header size */
  1787		l2_len = ip.hdr - skb->data;
  1788		offset = (l2_len / 2) << ICE_TX_DESC_LEN_MACLEN_S;
  1789	
  1790		/* set the tx_flags to indicate the IP protocol type. this is
  1791		 * required so that checksum header computation below is accurate.
  1792		 */
  1793		if (ip.v4->version == 4)
  1794			first->tx_flags |= ICE_TX_FLAGS_IPV4;
  1795		else if (ip.v6->version == 6)
  1796			first->tx_flags |= ICE_TX_FLAGS_IPV6;
  1797	
  1798		if (skb->encapsulation) {
  1799			bool gso_ena = false;
  1800			u32 tunnel = 0;
  1801	
  1802			/* define outer network header type */
  1803			if (first->tx_flags & ICE_TX_FLAGS_IPV4) {
  1804				tunnel |= (first->tx_flags & ICE_TX_FLAGS_TSO) ?
  1805					  ICE_TX_CTX_EIPT_IPV4 :
  1806					  ICE_TX_CTX_EIPT_IPV4_NO_CSUM;
  1807				l4_proto = ip.v4->protocol;
  1808			} else if (first->tx_flags & ICE_TX_FLAGS_IPV6) {
  1809				int ret;
  1810	
  1811				tunnel |= ICE_TX_CTX_EIPT_IPV6;
  1812				exthdr = ip.hdr + sizeof(*ip.v6);
  1813				l4_proto = ip.v6->nexthdr;
  1814				ret = ipv6_skip_exthdr(skb, exthdr - skb->data,
  1815						       &l4_proto, &frag_off);
  1816				if (ret < 0)
  1817					return -1;
  1818			}
  1819	
  1820			/* define outer transport */
  1821			switch (l4_proto) {
  1822			case IPPROTO_UDP:
  1823				tunnel |= ICE_TXD_CTX_UDP_TUNNELING;
  1824				first->tx_flags |= ICE_TX_FLAGS_TUNNEL;
  1825				break;
  1826			case IPPROTO_GRE:
  1827				tunnel |= ICE_TXD_CTX_GRE_TUNNELING;
  1828				first->tx_flags |= ICE_TX_FLAGS_TUNNEL;
  1829				break;
  1830			case IPPROTO_IPIP:
  1831			case IPPROTO_IPV6:
  1832				first->tx_flags |= ICE_TX_FLAGS_TUNNEL;
  1833				l4.hdr = skb_inner_network_header(skb);
  1834				break;
  1835			default:
  1836				if (first->tx_flags & ICE_TX_FLAGS_TSO)
  1837					return -1;
  1838	
  1839				skb_checksum_help(skb);
  1840				return 0;
  1841			}
  1842	
  1843			/* compute outer L3 header size */
  1844			tunnel |= ((l4.hdr - ip.hdr) / 4) <<
  1845				  ICE_TXD_CTX_QW0_EIPLEN_S;
  1846	
  1847			/* switch IP header pointer from outer to inner header */
  1848			ip.hdr = skb_inner_network_header(skb);
  1849	
  1850			/* compute tunnel header size */
  1851			tunnel |= ((ip.hdr - l4.hdr) / 2) <<
  1852				   ICE_TXD_CTX_QW0_NATLEN_S;
  1853	
  1854			gso_ena = skb_shinfo(skb)->gso_type & SKB_GSO_PARTIAL;
  1855			/* indicate if we need to offload outer UDP header */
  1856			if ((first->tx_flags & ICE_TX_FLAGS_TSO) && !gso_ena &&
  1857			    (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_TUNNEL_CSUM))
  1858				tunnel |= ICE_TXD_CTX_QW0_L4T_CS_M;
  1859	
  1860			/* record tunnel offload values */
  1861			off->cd_tunnel_params |= tunnel;
  1862	
  1863			/* set DTYP=1 to indicate that it's an Tx context descriptor
  1864			 * in IPsec tunnel mode with Tx offloads in Quad word 1
  1865			 */
  1866			off->cd_qw1 |= (u64)ICE_TX_DESC_DTYPE_CTX;
  1867	
  1868			/* switch L4 header pointer from outer to inner */
  1869			l4.hdr = skb_inner_transport_header(skb);
  1870			l4_proto = 0;
  1871	
  1872			/* reset type as we transition from outer to inner headers */
  1873			first->tx_flags &= ~(ICE_TX_FLAGS_IPV4 | ICE_TX_FLAGS_IPV6);
  1874			if (ip.v4->version == 4)
  1875				first->tx_flags |= ICE_TX_FLAGS_IPV4;
  1876			if (ip.v6->version == 6)
  1877				first->tx_flags |= ICE_TX_FLAGS_IPV6;
  1878		}
  1879	
  1880		/* Enable IP checksum offloads */
  1881		if (first->tx_flags & ICE_TX_FLAGS_IPV4) {
  1882			l4_proto = ip.v4->protocol;
  1883			/* the stack computes the IP header already, the only time we
  1884			 * need the hardware to recompute it is in the case of TSO.
  1885			 */
  1886			if (first->tx_flags & ICE_TX_FLAGS_TSO)
  1887				cmd |= ICE_TX_DESC_CMD_IIPT_IPV4_CSUM;
  1888			else
  1889				cmd |= ICE_TX_DESC_CMD_IIPT_IPV4;
  1890	
  1891		} else if (first->tx_flags & ICE_TX_FLAGS_IPV6) {
  1892			cmd |= ICE_TX_DESC_CMD_IIPT_IPV6;
  1893			exthdr = ip.hdr + sizeof(*ip.v6);
  1894			l4_proto = ip.v6->nexthdr;
  1895			if (l4.hdr != exthdr)
  1896				ipv6_skip_exthdr(skb, exthdr - skb->data, &l4_proto,
  1897						 &frag_off);
  1898		} else {
  1899			return -1;
  1900		}
  1901	
  1902		/* compute inner L3 header size */
  1903		l3_len = l4.hdr - ip.hdr;
  1904		offset |= (l3_len / 4) << ICE_TX_DESC_LEN_IPLEN_S;
  1905	
  1906		if ((tx_ring->netdev->features & NETIF_F_HW_CSUM) &&
  1907		    !(first->tx_flags & ICE_TX_FLAGS_TSO) &&
  1908		    !skb_csum_is_sctp(skb)) {
  1909			/* Set GCS */
  1910			u16 csum_start = (skb->csum_start - skb->mac_header) / 2;
  1911			u16 csum_offset = skb->csum_offset / 2;
  1912			u16 gcs_params;
  1913	
  1914			gcs_params = FIELD_PREP(ICE_TX_GCS_DESC_START_M, csum_start) |
  1915				     FIELD_PREP(ICE_TX_GCS_DESC_OFFSET_M, csum_offset) |
> 1916				     FIELD_PREP(ICE_TX_GCS_DESC_TYPE_M |
> 1917						ICE_TX_GCS_DESC_CSUM_PSH);
  1918	
  1919			/* Unlike legacy HW checksums, GCS requires a context
  1920			 * descriptor.
  1921			 */
  1922			off->cd_qw1 |= ICE_TX_DESC_DTYPE_CTX;
  1923			off->cd_gcs_params = gcs_params;
  1924			/* Fill out CSO info in data descriptors */
  1925			off->td_offset |= offset;
  1926			off->td_cmd |= cmd;
  1927			return 1;
  1928		}
  1929	
  1930		/* Enable L4 checksum offloads */
  1931		switch (l4_proto) {
  1932		case IPPROTO_TCP:
  1933			/* enable checksum offloads */
  1934			cmd |= ICE_TX_DESC_CMD_L4T_EOFT_TCP;
  1935			l4_len = l4.tcp->doff;
  1936			offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
  1937			break;
  1938		case IPPROTO_UDP:
  1939			/* enable UDP checksum offload */
  1940			cmd |= ICE_TX_DESC_CMD_L4T_EOFT_UDP;
  1941			l4_len = (sizeof(struct udphdr) >> 2);
  1942			offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
  1943			break;
  1944		case IPPROTO_SCTP:
  1945			/* enable SCTP checksum offload */
  1946			cmd |= ICE_TX_DESC_CMD_L4T_EOFT_SCTP;
  1947			l4_len = sizeof(struct sctphdr) >> 2;
  1948			offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
  1949			break;
  1950	
  1951		default:
  1952			if (first->tx_flags & ICE_TX_FLAGS_TSO)
  1953				return -1;
  1954			skb_checksum_help(skb);
  1955			return 0;
  1956		}
  1957	
  1958		off->td_cmd |= cmd;
  1959		off->td_offset |= offset;
  1960		return 1;
  1961	}
  1962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
