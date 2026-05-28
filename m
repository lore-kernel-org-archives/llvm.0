Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3D351C20
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779997226; cv=none; b=FFQ1zR0Ia8JpgNrbjyf1nzzLkgSTRcpudvtXOJX7IKiI8xpzuAbfDi2JnM79MCMNFI8axp9e4FaK6xhPANpVQXkPr0okctPqh4d+IeJCRzG242OnPzfzkONWq+9u1dHyprdkrGa4MqSjOpRtO/YTHennHARTDDa4AvPTJwhgGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779997226; c=relaxed/simple;
	bh=AlOAqg3chpo0tccwiZnIVN3D088wciwJm/ce5n9f8Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sw3njBGXtf8xt2KbJyzyUfxNr36KCNe+gENAwbmJoBhZte4+X5KJc1euBJyma54JEQuiUEoid5myNndW4dy+RPd4RO4tga//b3YCc7Bu+q5flER5bz1nklHxka9SD1bKXPNh29Tin5HOYjCMbRg4zx/GuvEf0Dv2NOSerwA+FDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUYRvXp+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUYRvXp+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ed9336049so2767144f8f.0
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779997222; x=1780602022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5WK7epCm+OUJHg1Fxg9z6/O5n24m8mtrKEpcSvcGi0=;
        b=gUYRvXp+2wF+wf9NjjPg7ZsvVyXw+Zi4OB6DJAqdu3aOA1/KCyewjfKLgEOVzCnwz0
         W2IoUXqhq5Qx/PI4AiV/rWax00ugfg0aquVDBwAhxjW0wXEl/3AMCtUvLCcPKY0L9YYV
         EPnVaM+sqzQ+wlAVEoGEq7FM90vvaHnX8UPcuND+Q5HRtGhXYgOnvOdz1JnVxzu4+ldu
         xG9cccDQ47v5i7HabodJCzXHpuLfc1WClUS3pwrHbQAm/rBrpwHoNpd6q3YFSH862yuZ
         C5snM+8elzJ6fgVntDG5HI3C3KFzew0TpKO489LzwtzVfcHMQlC1ZRFkURcjpvfcL1K4
         ituA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779997222; x=1780602022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5WK7epCm+OUJHg1Fxg9z6/O5n24m8mtrKEpcSvcGi0=;
        b=G7VsIobmHjQLOrUxLhhfMaz+a2wQ+fDCW/mIEA/cFonZzbh3mKyQrBXw32Vlox574X
         RnvJWDRXbttDiKXLX8YZpK+42H+2p56upEZlfL0lcrMujGqa62kYKsWtHd6N5PJh4Lay
         ssgpTdcfeWdQANtwIthSDRKY8+a3a7d5dfGytK76YM15UwQq0H2xgIBcQCKiJXGif4mW
         YHaM36Xy9PgFtEv9+Jww+WzrMkVyCtSJBBh+xS7Apc9rg3N9j/SQMnqSAP3UhJ1aClXx
         fCXYgTZysMFynLaOxDaTeCbg7QOuwFolrIhbQLFoo2WrACtfA2T7wK850grPOLhhYvSp
         j4/g==
X-Forwarded-Encrypted: i=1; AFNElJ8fOb5E+0J+tQ3Qp2j6VHnH9Nb4JKW9XivVuNdFzdxF03oNLlo/+xstbqpZv7mCm+CiaJxa@lists.linux.dev
X-Gm-Message-State: AOJu0YxWjKUXq+Ia0xAT/A7+4Td/GgkrnMMGltaCUjYKW4aQAuZAdBAC
	RD/E7J6bg4vlqAlQovDXahmC0mPR3xJp7ZrUhwBs452UjULNFSte6r96
X-Gm-Gg: Acq92OEnDvL3FGXldZetkQJP2WLIBdfhVkmPjya29E3azDnEQqBJpM7U8OQFjvVOj1W
	FQa/Nz5MKo2ijvCgTrZ7zgQ5MX8mYpM1GQ0G9TdiLuri+WoHVP5HSmk9wnTsI/9AvFO5Ua74QRg
	oJ4FSPIfc1Ed0mInKewpQHfSaurQkvc/PI+arJjqFc2K90OH2YKavgbAVfSaHUPIvi6et2NZ2a6
	UjMjp/2Ra/7uJUM4ui7OTLjpsJqRAb+MZoG3UnbjSpnIL1Z8Pbn1/ocr+iou9HiTLl2JF0Jpd8d
	KcejuRFfmiwT6PDz7/JvRLoPCbIdlNGU4iNmCpt4aDLh0dcLlAa6HlzYhAF6DA5gXlT/T38p/o1
	LNHdoQK6p0d+IMSRHVKXfr++AFJkFMCgQuD4OG9UkBI6gHZn1/vFoz+22Fjv4+9CJGHYqgC3C2s
	YtlriPcZ8e53e8xKEw+du/S5mDNPD4kRLVCcFemol14Bssm6kQnnJ9zOXj3L541NOZIwT2dko=
X-Received: by 2002:a5d:46c4:0:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-45ef02bb582mr743686f8f.13.1779997222188;
        Thu, 28 May 2026 12:40:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8845708f8f.16.2026.05.28.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:40:21 -0700 (PDT)
Date: Thu, 28 May 2026 20:40:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Kacper Kokot <kacper.kokot.44@gmail.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter
 <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option
 is unaligned
Message-ID: <20260528204020.7ae744ab@pumpkin>
In-Reply-To: <202605290221.PE1wkPWQ-lkp@intel.com>
References: <20260525201116.407338-2-kacper.kokot.44@gmail.com>
	<202605290221.PE1wkPWQ-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 02:11:48 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Kacper,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on nf-next/main]
> [also build test WARNING on netfilter-nf/main linus/master v7.1-rc5 next-20260527]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kacper-Kokot/netfilter-TCPMSS-fix-dropped-packets-when-MSS-option-is-unaligned/20260526-041308
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git main
> patch link:    https://lore.kernel.org/r/20260525201116.407338-2-kacper.kokot.44%40gmail.com
> patch subject: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option is unaligned
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260529/202605290221.PE1wkPWQ-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290221.PE1wkPWQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605290221.PE1wkPWQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> net/netfilter/xt_TCPMSS.c:140:45: warning: & has lower precedence than !=; != will be evaluated first [-Wparentheses]  
>      140 |                         if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {
>          |                                                                  ^~~~~~~~~~
>    net/netfilter/xt_TCPMSS.c:140:45: note: place parentheses around the '!=' expression to silence this warning
>      140 |                         if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {
>          |                                                                  ^         
>          |                                                                    (       )
>    net/netfilter/xt_TCPMSS.c:140:45: note: place parentheses around the & expression to evaluate it first
>      140 |                         if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {
>          |                                                                  ^
>          |                             (                                         )
>    1 warning generated.

This has been noted a lot of times.
While 'unusual' the expression is actually correct (but does need changing).
Mostly because the '!= 0' isn't needed and '0x1 != 0' is 1.

-- David

> 
> 
> vim +140 net/netfilter/xt_TCPMSS.c
> 
>     69	
>     70	static int
>     71	tcpmss_mangle_packet(struct sk_buff *skb,
>     72			     const struct xt_action_param *par,
>     73			     unsigned int family,
>     74			     unsigned int tcphoff,
>     75			     unsigned int minlen)
>     76	{
>     77		const struct xt_tcpmss_info *info = par->targinfo;
>     78		struct tcphdr *tcph;
>     79		int len, tcp_hdrlen;
>     80		unsigned int i;
>     81		__be16 oldval;
>     82		u16 newmss;
>     83		u8 *opt;
>     84	
>     85		/* This is a fragment, no TCP header is available */
>     86		if (par->fragoff != 0)
>     87			return 0;
>     88	
>     89		if (skb_ensure_writable(skb, skb->len))
>     90			return -1;
>     91	
>     92		len = skb->len - tcphoff;
>     93		if (len < (int)sizeof(struct tcphdr))
>     94			return -1;
>     95	
>     96		tcph = (struct tcphdr *)(skb_network_header(skb) + tcphoff);
>     97		tcp_hdrlen = tcph->doff * 4;
>     98	
>     99		if (len < tcp_hdrlen || tcp_hdrlen < sizeof(struct tcphdr))
>    100			return -1;
>    101	
>    102		if (info->mss == XT_TCPMSS_CLAMP_PMTU) {
>    103			struct net *net = xt_net(par);
>    104			unsigned int in_mtu = tcpmss_reverse_mtu(net, skb, family);
>    105			unsigned int min_mtu = min(dst_mtu(skb_dst(skb)), in_mtu);
>    106	
>    107			if (min_mtu <= minlen) {
>    108				net_err_ratelimited("unknown or invalid path-MTU (%u)\n",
>    109						    min_mtu);
>    110				return -1;
>    111			}
>    112			newmss = min_mtu - minlen;
>    113		} else
>    114			newmss = info->mss;
>    115	
>    116		opt = (u_int8_t *)tcph;
>    117		for (i = sizeof(struct tcphdr); i <= tcp_hdrlen - TCPOLEN_MSS; i += optlen(opt, i)) {
>    118			if (opt[i] == TCPOPT_MSS && opt[i+1] == TCPOLEN_MSS) {
>    119				u_int16_t oldmss;
>    120				u16 csum_oldmss, csum_newmss;
>    121	
>    122				oldmss = (opt[i+2] << 8) | opt[i+3];
>    123	
>    124				/* Never increase MSS, even when setting it, as
>    125				 * doing so results in problems for hosts that rely
>    126				 * on MSS being set correctly.
>    127				 */
>    128				if (oldmss <= newmss)
>    129					return 0;
>    130	
>    131				opt[i+2] = (newmss & 0xff00) >> 8;
>    132				opt[i+3] = newmss & 0x00ff;
>    133	
>    134				csum_oldmss = htons(oldmss);
>    135				csum_newmss = htons(newmss);
>    136	
>    137				/* MSS may be unaligned; fix up the incremental checksum
>    138				 * to avoid an invalid checksum and a dropped packet.
>    139				 */
>  > 140				if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {  
>    141					csum_oldmss = swab16(csum_oldmss);
>    142					csum_newmss = swab16(csum_newmss);
>    143				}
>    144	
>    145				inet_proto_csum_replace2(&tcph->check, skb,
>    146							 csum_oldmss, csum_newmss,
>    147							 false);
>    148				return 0;
>    149			}
>    150		}
>    151	
>    152		/* There is data after the header so the option can't be added
>    153		 * without moving it, and doing so may make the SYN packet
>    154		 * itself too large. Accept the packet unmodified instead.
>    155		 */
>    156		if (len > tcp_hdrlen)
>    157			return 0;
>    158	
>    159		/* tcph->doff has 4 bits, do not wrap it to 0 */
>    160		if (tcp_hdrlen >= 15 * 4)
>    161			return 0;
>    162	
>    163		/*
>    164		 * MSS Option not found ?! add it..
>    165		 */
>    166		if (skb_tailroom(skb) < TCPOLEN_MSS) {
>    167			if (pskb_expand_head(skb, 0,
>    168					     TCPOLEN_MSS - skb_tailroom(skb),
>    169					     GFP_ATOMIC))
>    170				return -1;
>    171			tcph = (struct tcphdr *)(skb_network_header(skb) + tcphoff);
>    172		}
>    173	
>    174		skb_put(skb, TCPOLEN_MSS);
>    175	
>    176		/*
>    177		 * IPv4: RFC 1122 states "If an MSS option is not received at
>    178		 * connection setup, TCP MUST assume a default send MSS of 536".
>    179		 * IPv6: RFC 2460 states IPv6 has a minimum MTU of 1280 and a minimum
>    180		 * length IPv6 header of 60, ergo the default MSS value is 1220
>    181		 * Since no MSS was provided, we must use the default values
>    182		 */
>    183		if (xt_family(par) == NFPROTO_IPV4)
>    184			newmss = min(newmss, (u16)536);
>    185		else
>    186			newmss = min(newmss, (u16)1220);
>    187	
>    188		opt = (u_int8_t *)tcph + sizeof(struct tcphdr);
>    189		memmove(opt + TCPOLEN_MSS, opt, len - sizeof(struct tcphdr));
>    190	
>    191		inet_proto_csum_replace2(&tcph->check, skb,
>    192					 htons(len), htons(len + TCPOLEN_MSS), true);
>    193		opt[0] = TCPOPT_MSS;
>    194		opt[1] = TCPOLEN_MSS;
>    195		opt[2] = (newmss & 0xff00) >> 8;
>    196		opt[3] = newmss & 0x00ff;
>    197	
>    198		inet_proto_csum_replace4(&tcph->check, skb, 0, *((__be32 *)opt), false);
>    199	
>    200		oldval = ((__be16 *)tcph)[6];
>    201		tcph->doff += TCPOLEN_MSS/4;
>    202		inet_proto_csum_replace2(&tcph->check, skb,
>    203					 oldval, ((__be16 *)tcph)[6], false);
>    204		return TCPOLEN_MSS;
>    205	}
>    206	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

