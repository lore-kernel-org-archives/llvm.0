Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00AC3264FA;
	Sun, 17 May 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778999186; cv=none; b=rxKian/dB6HxbbHXAqrq1VOr76aOVR7w15mVtkbMsjsWbZshsEJLcnuzmJSeknujGZ67egGPRBmnTHOvnuILtm8jMKGg5BeFDK3M+ARHIjgALU7ijYc32QFk8Sn9Tj4J40fmmxrjxNGjSXrneqGb7PBSTtZnOD0XiIvWMicDN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778999186; c=relaxed/simple;
	bh=CbY+CLxHlvhE6q9CwZ+8dwsPLrTd6Pu4Ma8URUFeT7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awI4usVWrQdcXB97097FjR91/AVLfPZQ5ytxNd38GPkBLHKteYMEWO5KAEeFtE2B5PHaimBqyVsIUq94yzPCY9XsaguGrwVTvkjPXjshScvypyvvJv8S/7UQbistTeZS/mdR20GwLsgGEq4C7oHe3Bl8X5eJvf9dgeOBZ/khBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGE/naP2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGE/naP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778999184; x=1810535184;
  h=date:from:to:cc:subject:message-id;
  bh=CbY+CLxHlvhE6q9CwZ+8dwsPLrTd6Pu4Ma8URUFeT7k=;
  b=iGE/naP2ouvOZzGX2O6InEqjxPqYrUX9rpt/nur+onVVWhbALBbDpjOA
   0MOu3aaqq6g0nFROIBW/X1cfHLimArWwu/hGl71pz4gtfZPHD5hzT1Av6
   cyVQY6fc8ipVAj6PGq9yiUUFNApaNWg0QlEt5bCHRQEBR4fxBBAsU7iAU
   PoUFqMbuFmWMWZwj+XUTYvPyAuaSyCKdfSsfktycf0EuAU3WwDZ//oQqB
   r1VNlpNp56nDFhEwFvhZgJO29XNs9l4e9SDwH1YqO/RlXDF/XNmAdGq+5
   /ax8xguCg0+4EiiWKLcNLYzPSu+U/jaO0PBi3o3Rog3MV/C4LsIhlvyyk
   g==;
X-CSE-ConnectionGUID: o1h/B+kmQ6SIIfu3MoksRA==
X-CSE-MsgGUID: gHJduZ+1QweVHsQy/bAL9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="67416318"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="67416318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:26:21 -0700
X-CSE-ConnectionGUID: DvRInHUVSn6ej56txJ4k9w==
X-CSE-MsgGUID: gLkn123RScm2wyhHEdX8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244073018"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 23:26:19 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOUx6-000000001P2-2y7B;
	Sun, 17 May 2026 06:26:16 +0000
Date: Sun, 17 May 2026 14:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 MD Danish Anwar <danishanwar@ti.com>
Subject: [mda-next:icssg-dev 2/8] net/packet/af_packet.c:4206:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202605171457.R1kMOe0b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   7aa6108bf5c5328d646e91a0451eeae42a672801
commit: aef82098c09185d2c12ede3e5708cd3b55e4cc21 [2/8] af_packet: Add port specific handling for HSR
config: powerpc-ppc44x_defconfig (https://download.01.org/0day-ci/archive/20260517/202605171457.R1kMOe0b-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171457.R1kMOe0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171457.R1kMOe0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/packet/af_packet.c:4206:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    4206 |         default:
         |         ^
   net/packet/af_packet.c:4206:2: note: insert '__attribute__((fallthrough));' to silence this warning
    4206 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   net/packet/af_packet.c:4206:2: note: insert 'break;' to avoid fall-through
    4206 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +4206 net/packet/af_packet.c

^1da177e4c3f415 Linus Torvalds            2005-04-16  3903  
^1da177e4c3f415 Linus Torvalds            2005-04-16  3904  static int
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  3905  packet_setsockopt(struct socket *sock, int level, int optname, sockptr_t optval,
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  3906  		  unsigned int optlen)
^1da177e4c3f415 Linus Torvalds            2005-04-16  3907  {
^1da177e4c3f415 Linus Torvalds            2005-04-16  3908  	struct sock *sk = sock->sk;
8dc419447415966 Herbert Xu                2007-02-04  3909  	struct packet_sock *po = pkt_sk(sk);
^1da177e4c3f415 Linus Torvalds            2005-04-16  3910  	int ret;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3911  
^1da177e4c3f415 Linus Torvalds            2005-04-16  3912  	if (level != SOL_PACKET)
^1da177e4c3f415 Linus Torvalds            2005-04-16  3913  		return -ENOPROTOOPT;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3914  
^1da177e4c3f415 Linus Torvalds            2005-04-16  3915  	switch (optname) {
^1da177e4c3f415 Linus Torvalds            2005-04-16  3916  	case PACKET_ADD_MEMBERSHIP:
^1da177e4c3f415 Linus Torvalds            2005-04-16  3917  	case PACKET_DROP_MEMBERSHIP:
^1da177e4c3f415 Linus Torvalds            2005-04-16  3918  	{
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3919  		struct packet_mreq_max mreq;
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3920  		int len = optlen;
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3921  		memset(&mreq, 0, sizeof(mreq));
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3922  		if (len < sizeof(struct packet_mreq))
^1da177e4c3f415 Linus Torvalds            2005-04-16  3923  			return -EINVAL;
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3924  		if (len > sizeof(mreq))
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3925  			len = sizeof(mreq);
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  3926  		if (copy_from_sockptr(&mreq, optval, len))
^1da177e4c3f415 Linus Torvalds            2005-04-16  3927  			return -EFAULT;
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3928  		if (len < (mreq.mr_alen + offsetof(struct packet_mreq, mr_address)))
0fb375fb9b93b7d Eric W. Biederman         2005-09-21  3929  			return -EINVAL;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3930  		if (optname == PACKET_ADD_MEMBERSHIP)
^1da177e4c3f415 Linus Torvalds            2005-04-16  3931  			ret = packet_mc_add(sk, &mreq);
^1da177e4c3f415 Linus Torvalds            2005-04-16  3932  		else
^1da177e4c3f415 Linus Torvalds            2005-04-16  3933  			ret = packet_mc_drop(sk, &mreq);
^1da177e4c3f415 Linus Torvalds            2005-04-16  3934  		return ret;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3935  	}
a2efcfa04865eaa David S. Miller           2007-05-29  3936  
^1da177e4c3f415 Linus Torvalds            2005-04-16  3937  	case PACKET_RX_RING:
69e3c75f4d541a6 Johann Baudy              2009-05-18  3938  	case PACKET_TX_RING:
^1da177e4c3f415 Linus Torvalds            2005-04-16  3939  	{
f6fb8f100b80737 chetan loke               2011-08-19  3940  		union tpacket_req_u req_u;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3941  
86d43e2bf93ccac Eric Dumazet              2024-04-05  3942  		ret = -EINVAL;
5171b37d959641b Eric Dumazet              2018-04-15  3943  		lock_sock(sk);
f6fb8f100b80737 chetan loke               2011-08-19  3944  		switch (po->tp_version) {
f6fb8f100b80737 chetan loke               2011-08-19  3945  		case TPACKET_V1:
f6fb8f100b80737 chetan loke               2011-08-19  3946  		case TPACKET_V2:
86d43e2bf93ccac Eric Dumazet              2024-04-05  3947  			if (optlen < sizeof(req_u.req))
86d43e2bf93ccac Eric Dumazet              2024-04-05  3948  				break;
86d43e2bf93ccac Eric Dumazet              2024-04-05  3949  			ret = copy_from_sockptr(&req_u.req, optval,
86d43e2bf93ccac Eric Dumazet              2024-04-05  3950  						sizeof(req_u.req)) ?
86d43e2bf93ccac Eric Dumazet              2024-04-05  3951  						-EINVAL : 0;
f6fb8f100b80737 chetan loke               2011-08-19  3952  			break;
f6fb8f100b80737 chetan loke               2011-08-19  3953  		case TPACKET_V3:
f6fb8f100b80737 chetan loke               2011-08-19  3954  		default:
86d43e2bf93ccac Eric Dumazet              2024-04-05  3955  			if (optlen < sizeof(req_u.req3))
86d43e2bf93ccac Eric Dumazet              2024-04-05  3956  				break;
86d43e2bf93ccac Eric Dumazet              2024-04-05  3957  			ret = copy_from_sockptr(&req_u.req3, optval,
86d43e2bf93ccac Eric Dumazet              2024-04-05  3958  						sizeof(req_u.req3)) ?
86d43e2bf93ccac Eric Dumazet              2024-04-05  3959  						-EINVAL : 0;
f6fb8f100b80737 chetan loke               2011-08-19  3960  			break;
f6fb8f100b80737 chetan loke               2011-08-19  3961  		}
86d43e2bf93ccac Eric Dumazet              2024-04-05  3962  		if (!ret)
5171b37d959641b Eric Dumazet              2018-04-15  3963  			ret = packet_set_ring(sk, &req_u, 0,
f6fb8f100b80737 chetan loke               2011-08-19  3964  					      optname == PACKET_TX_RING);
5171b37d959641b Eric Dumazet              2018-04-15  3965  		release_sock(sk);
5171b37d959641b Eric Dumazet              2018-04-15  3966  		return ret;
5171b37d959641b Eric Dumazet              2018-04-15  3967  	}
^1da177e4c3f415 Linus Torvalds            2005-04-16  3968  	case PACKET_COPY_THRESH:
^1da177e4c3f415 Linus Torvalds            2005-04-16  3969  	{
^1da177e4c3f415 Linus Torvalds            2005-04-16  3970  		int val;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3971  
^1da177e4c3f415 Linus Torvalds            2005-04-16  3972  		if (optlen != sizeof(val))
^1da177e4c3f415 Linus Torvalds            2005-04-16  3973  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  3974  		if (copy_from_sockptr(&val, optval, sizeof(val)))
^1da177e4c3f415 Linus Torvalds            2005-04-16  3975  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3976  
76839e2f1fded42 Juntong Deng              2024-03-08  3977  		WRITE_ONCE(pkt_sk(sk)->copy_thresh, val);
^1da177e4c3f415 Linus Torvalds            2005-04-16  3978  		return 0;
^1da177e4c3f415 Linus Torvalds            2005-04-16  3979  	}
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3980  	case PACKET_VERSION:
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3981  	{
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3982  		int val;
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3983  
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3984  		if (optlen != sizeof(val))
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3985  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  3986  		if (copy_from_sockptr(&val, optval, sizeof(val)))
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3987  			return -EFAULT;
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3988  		switch (val) {
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3989  		case TPACKET_V1:
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3990  		case TPACKET_V2:
f6fb8f100b80737 chetan loke               2011-08-19  3991  		case TPACKET_V3:
84ac7260236a49c Philip Pettersson         2016-11-30  3992  			break;
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3993  		default:
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3994  			return -EINVAL;
bbd6ef87c544d88 Patrick McHardy           2008-07-14  3995  		}
84ac7260236a49c Philip Pettersson         2016-11-30  3996  		lock_sock(sk);
84ac7260236a49c Philip Pettersson         2016-11-30  3997  		if (po->rx_ring.pg_vec || po->tx_ring.pg_vec) {
84ac7260236a49c Philip Pettersson         2016-11-30  3998  			ret = -EBUSY;
84ac7260236a49c Philip Pettersson         2016-11-30  3999  		} else {
84ac7260236a49c Philip Pettersson         2016-11-30  4000  			po->tp_version = val;
84ac7260236a49c Philip Pettersson         2016-11-30  4001  			ret = 0;
84ac7260236a49c Philip Pettersson         2016-11-30  4002  		}
84ac7260236a49c Philip Pettersson         2016-11-30  4003  		release_sock(sk);
84ac7260236a49c Philip Pettersson         2016-11-30  4004  		return ret;
bbd6ef87c544d88 Patrick McHardy           2008-07-14  4005  	}
8913336a7e8d56e Patrick McHardy           2008-07-18  4006  	case PACKET_RESERVE:
8913336a7e8d56e Patrick McHardy           2008-07-18  4007  	{
8913336a7e8d56e Patrick McHardy           2008-07-18  4008  		unsigned int val;
8913336a7e8d56e Patrick McHardy           2008-07-18  4009  
8913336a7e8d56e Patrick McHardy           2008-07-18  4010  		if (optlen != sizeof(val))
8913336a7e8d56e Patrick McHardy           2008-07-18  4011  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4012  		if (copy_from_sockptr(&val, optval, sizeof(val)))
8913336a7e8d56e Patrick McHardy           2008-07-18  4013  			return -EFAULT;
bcc5364bdcfe131 Andrey Konovalov          2017-03-29  4014  		if (val > INT_MAX)
bcc5364bdcfe131 Andrey Konovalov          2017-03-29  4015  			return -EINVAL;
c27927e372f0785 Willem de Bruijn          2017-08-10  4016  		lock_sock(sk);
c27927e372f0785 Willem de Bruijn          2017-08-10  4017  		if (po->rx_ring.pg_vec || po->tx_ring.pg_vec) {
c27927e372f0785 Willem de Bruijn          2017-08-10  4018  			ret = -EBUSY;
c27927e372f0785 Willem de Bruijn          2017-08-10  4019  		} else {
8913336a7e8d56e Patrick McHardy           2008-07-18  4020  			po->tp_reserve = val;
c27927e372f0785 Willem de Bruijn          2017-08-10  4021  			ret = 0;
c27927e372f0785 Willem de Bruijn          2017-08-10  4022  		}
c27927e372f0785 Willem de Bruijn          2017-08-10  4023  		release_sock(sk);
c27927e372f0785 Willem de Bruijn          2017-08-10  4024  		return ret;
8913336a7e8d56e Patrick McHardy           2008-07-18  4025  	}
69e3c75f4d541a6 Johann Baudy              2009-05-18  4026  	case PACKET_LOSS:
69e3c75f4d541a6 Johann Baudy              2009-05-18  4027  	{
69e3c75f4d541a6 Johann Baudy              2009-05-18  4028  		unsigned int val;
69e3c75f4d541a6 Johann Baudy              2009-05-18  4029  
69e3c75f4d541a6 Johann Baudy              2009-05-18  4030  		if (optlen != sizeof(val))
69e3c75f4d541a6 Johann Baudy              2009-05-18  4031  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4032  		if (copy_from_sockptr(&val, optval, sizeof(val)))
69e3c75f4d541a6 Johann Baudy              2009-05-18  4033  			return -EFAULT;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4034  
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4035  		lock_sock(sk);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4036  		if (po->rx_ring.pg_vec || po->tx_ring.pg_vec) {
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4037  			ret = -EBUSY;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4038  		} else {
164bddace2e03f6 Eric Dumazet              2023-03-16  4039  			packet_sock_flag_set(po, PACKET_SOCK_TP_LOSS, val);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4040  			ret = 0;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4041  		}
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4042  		release_sock(sk);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4043  		return ret;
69e3c75f4d541a6 Johann Baudy              2009-05-18  4044  	}
8dc419447415966 Herbert Xu                2007-02-04  4045  	case PACKET_AUXDATA:
8dc419447415966 Herbert Xu                2007-02-04  4046  	{
8dc419447415966 Herbert Xu                2007-02-04  4047  		int val;
8dc419447415966 Herbert Xu                2007-02-04  4048  
8dc419447415966 Herbert Xu                2007-02-04  4049  		if (optlen < sizeof(val))
8dc419447415966 Herbert Xu                2007-02-04  4050  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4051  		if (copy_from_sockptr(&val, optval, sizeof(val)))
8dc419447415966 Herbert Xu                2007-02-04  4052  			return -EFAULT;
8dc419447415966 Herbert Xu                2007-02-04  4053  
fd53c297aa7b077 Eric Dumazet              2023-03-16  4054  		packet_sock_flag_set(po, PACKET_SOCK_AUXDATA, val);
8dc419447415966 Herbert Xu                2007-02-04  4055  		return 0;
8dc419447415966 Herbert Xu                2007-02-04  4056  	}
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4057  	case PACKET_ORIGDEV:
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4058  	{
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4059  		int val;
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4060  
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4061  		if (optlen < sizeof(val))
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4062  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4063  		if (copy_from_sockptr(&val, optval, sizeof(val)))
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4064  			return -EFAULT;
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4065  
ee5675ecdf7a4e7 Eric Dumazet              2023-03-16  4066  		packet_sock_flag_set(po, PACKET_SOCK_ORIGDEV, val);
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4067  		return 0;
80feaacb8a6400a Peter P. Waskiewicz Jr    2007-04-20  4068  	}
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4069  	case PACKET_VNET_HDR:
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4070  	case PACKET_VNET_HDR_SZ:
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4071  	{
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4072  		int val, hdr_len;
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4073  
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4074  		if (sock->type != SOCK_RAW)
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4075  			return -EINVAL;
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4076  		if (optlen < sizeof(val))
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4077  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4078  		if (copy_from_sockptr(&val, optval, sizeof(val)))
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4079  			return -EFAULT;
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4080  
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4081  		if (optname == PACKET_VNET_HDR_SZ) {
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4082  			if (val && val != sizeof(struct virtio_net_hdr) &&
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4083  			    val != sizeof(struct virtio_net_hdr_mrg_rxbuf))
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4084  				return -EINVAL;
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4085  			hdr_len = val;
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4086  		} else {
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4087  			hdr_len = val ? sizeof(struct virtio_net_hdr) : 0;
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4088  		}
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4089  		lock_sock(sk);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4090  		if (po->rx_ring.pg_vec || po->tx_ring.pg_vec) {
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4091  			ret = -EBUSY;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4092  		} else {
dfc39d4026fb243 Jianfeng Tan              2023-04-19  4093  			WRITE_ONCE(po->vnet_hdr_sz, hdr_len);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4094  			ret = 0;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4095  		}
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4096  		release_sock(sk);
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4097  		return ret;
bfd5f4a3d605e0f Sridhar Samudrala         2010-02-04  4098  	}
614f60fa9d73a9e Scott McMillan            2010-06-02  4099  	case PACKET_TIMESTAMP:
614f60fa9d73a9e Scott McMillan            2010-06-02  4100  	{
614f60fa9d73a9e Scott McMillan            2010-06-02  4101  		int val;
614f60fa9d73a9e Scott McMillan            2010-06-02  4102  
614f60fa9d73a9e Scott McMillan            2010-06-02  4103  		if (optlen != sizeof(val))
614f60fa9d73a9e Scott McMillan            2010-06-02  4104  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4105  		if (copy_from_sockptr(&val, optval, sizeof(val)))
614f60fa9d73a9e Scott McMillan            2010-06-02  4106  			return -EFAULT;
614f60fa9d73a9e Scott McMillan            2010-06-02  4107  
1051ce4ab64db91 Eric Dumazet              2023-03-16  4108  		WRITE_ONCE(po->tp_tstamp, val);
614f60fa9d73a9e Scott McMillan            2010-06-02  4109  		return 0;
614f60fa9d73a9e Scott McMillan            2010-06-02  4110  	}
dc99f600698dcac David S. Miller           2011-07-05  4111  	case PACKET_FANOUT:
dc99f600698dcac David S. Miller           2011-07-05  4112  	{
9c661b0b85444e4 Tanner Love               2020-11-06  4113  		struct fanout_args args = { 0 };
dc99f600698dcac David S. Miller           2011-07-05  4114  
9c661b0b85444e4 Tanner Love               2020-11-06  4115  		if (optlen != sizeof(int) && optlen != sizeof(args))
dc99f600698dcac David S. Miller           2011-07-05  4116  			return -EINVAL;
9c661b0b85444e4 Tanner Love               2020-11-06  4117  		if (copy_from_sockptr(&args, optval, optlen))
dc99f600698dcac David S. Miller           2011-07-05  4118  			return -EFAULT;
dc99f600698dcac David S. Miller           2011-07-05  4119  
9c661b0b85444e4 Tanner Love               2020-11-06  4120  		return fanout_add(sk, &args);
dc99f600698dcac David S. Miller           2011-07-05  4121  	}
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4122  	case PACKET_FANOUT_DATA:
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4123  	{
e42e70ad6ae2ae5 Eric Dumazet              2022-01-31  4124  		/* Paired with the WRITE_ONCE() in fanout_add() */
e42e70ad6ae2ae5 Eric Dumazet              2022-01-31  4125  		if (!READ_ONCE(po->fanout))
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4126  			return -EINVAL;
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4127  
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4128  		return fanout_set_data(po, optval, optlen);
47dceb8ecdc1c3a Willem de Bruijn          2015-08-14  4129  	}
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4130  	case PACKET_IGNORE_OUTGOING:
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4131  	{
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4132  		int val;
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4133  
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4134  		if (optlen != sizeof(val))
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4135  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4136  		if (copy_from_sockptr(&val, optval, sizeof(val)))
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4137  			return -EFAULT;
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4138  		if (val < 0 || val > 1)
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4139  			return -EINVAL;
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4140  
6ebfad33161afac Eric Dumazet              2024-03-14  4141  		WRITE_ONCE(po->prot_hook.ignore_outgoing, !!val);
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4142  		return 0;
fa788d986a3aac5 Vincent Whitchurch        2018-09-03  4143  	}
5920cd3a41f1aef Paul Chavent              2012-11-06  4144  	case PACKET_TX_HAS_OFF:
5920cd3a41f1aef Paul Chavent              2012-11-06  4145  	{
5920cd3a41f1aef Paul Chavent              2012-11-06  4146  		unsigned int val;
5920cd3a41f1aef Paul Chavent              2012-11-06  4147  
5920cd3a41f1aef Paul Chavent              2012-11-06  4148  		if (optlen != sizeof(val))
5920cd3a41f1aef Paul Chavent              2012-11-06  4149  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4150  		if (copy_from_sockptr(&val, optval, sizeof(val)))
5920cd3a41f1aef Paul Chavent              2012-11-06  4151  			return -EFAULT;
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4152  
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4153  		lock_sock(sk);
25c55b38d85b54e Jiapeng Chong             2021-05-17  4154  		if (!po->rx_ring.pg_vec && !po->tx_ring.pg_vec)
7438344660fa55b Eric Dumazet              2023-03-16  4155  			packet_sock_flag_set(po, PACKET_SOCK_TX_HAS_OFF, val);
25c55b38d85b54e Jiapeng Chong             2021-05-17  4156  
a6361f0ca4b2546 Willem de Bruijn          2018-04-23  4157  		release_sock(sk);
5920cd3a41f1aef Paul Chavent              2012-11-06  4158  		return 0;
5920cd3a41f1aef Paul Chavent              2012-11-06  4159  	}
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4160  	case PACKET_QDISC_BYPASS:
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4161  	{
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4162  		int val;
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4163  
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4164  		if (optlen != sizeof(val))
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4165  			return -EINVAL;
a7b75c5a8c41445 Christoph Hellwig         2020-07-23  4166  		if (copy_from_sockptr(&val, optval, sizeof(val)))
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4167  			return -EFAULT;
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4168  
105a201ebf33129 Eric Dumazet              2023-03-17  4169  		packet_sock_flag_set(po, PACKET_SOCK_QDISC_BYPASS, val);
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4170  		return 0;
d346a3fae3ff1d9 Daniel Borkmann           2013-12-06  4171  	}
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4172  	case PACKET_HSR_BIND_PORT:
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4173  	{
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4174  #if IS_ENABLED(CONFIG_HSR)
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4175  		int old_val;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4176  		int val;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4177  
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4178  		if (optlen != sizeof(val))
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4179  			return -EINVAL;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4180  		if (copy_from_sockptr(&val, optval, sizeof(val)))
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4181  			return -EFAULT;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4182  
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4183  		old_val = !!po->hsr_bound_port;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4184  		switch (val) {
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4185  		case PACKET_HSR_BIND_PORT_AB:
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4186  			po->hsr_bound_port = 0;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4187  			break;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4188  		case PACKET_HSR_BIND_PORT_A:
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4189  			po->hsr_bound_port = HSR_PT_SLAVE_A;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4190  			break;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4191  		case PACKET_HSR_BIND_PORT_B:
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4192  			po->hsr_bound_port = HSR_PT_SLAVE_B;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4193  			break;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4194  		default:
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4195  			return -EINVAL;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4196  		}
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4197  		if (old_val != !!po->hsr_bound_port) {
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4198  			if (po->hsr_bound_port)
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4199  				static_branch_inc(&hsr_ptp_support_enabled);
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4200  			else
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4201  				static_branch_dec(&hsr_ptp_support_enabled);
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4202  		}
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4203  		return 0;
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4204  #endif
aef82098c09185d Sebastian Andrzej Siewior 2026-03-09  4205  	}
^1da177e4c3f415 Linus Torvalds            2005-04-16 @4206  	default:
^1da177e4c3f415 Linus Torvalds            2005-04-16  4207  		return -ENOPROTOOPT;
^1da177e4c3f415 Linus Torvalds            2005-04-16  4208  	}
^1da177e4c3f415 Linus Torvalds            2005-04-16  4209  }
^1da177e4c3f415 Linus Torvalds            2005-04-16  4210  

:::::: The code at line 4206 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
