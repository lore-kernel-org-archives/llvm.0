Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2BD21771B
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 23:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779837712; cv=pass; b=Z2tPpdT7HRrVEJfP83DUCUS11KRl4PowSblCiWu8jxo00K7p+sPjEO7v7SBWTXNrIuduAp/wX/yVcqGJgZzDvLi7QXWthqykmPG4DqeQQ7vqc3MBJDn6php85/Xj06ckHg0PchKvSDCq6cBYX6LdpGePVFwjD1cqUT7K8BuSbuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779837712; c=relaxed/simple;
	bh=u5AZ6lDvJHN6hkOMWJlEHdIYy+BPs1w8b0bOdZZRyJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8P1loUVUomiiqG9jxUxwmMUebwmX8mlQo+8Wpdy0jft0r43JcylwcnNbckyPyjoJFck8OCFktOuizbYdXtThk41HbgyFc4aVq2TynN5Q1N8nv3tM9JIwgnVvn2FjUsLWDOX4WWGLoZnoITs+NEORCwa+iygIRfRq/nriaBScMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjbisMCy; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjbisMCy"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69d78547957so2738451eaf.0
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 16:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779837710; cv=none;
        d=google.com; s=arc-20240605;
        b=BiSDU8tPqjBu1aS9V0Z7rvk/whZpDyv76OWTXqg2Z1ipQVICva6ft/kRVBF/gZdisj
         qvW7CAy38VaJ32zHVel+InDBKnklSENgZXQ7A6vheqOSLJEGU0SxCcsz3rNtaUnuaC1t
         W9W2J0syPDXYWK+rS+O1tThRsTyNZjD1YOC3dVVAB2yEf4Uc7dW5m1qfTZkVDjl5Rhza
         k9iZGxZwr/yHF6uRjpK2ZE7zgQnXHLU0042bNmnT2Dk95uxCRZ2T6Q/+usluW1j+K9H7
         GIsPlzwZquTSmEfzgp7zHtBsGE5b1t9o0m7HE8hpA0NQOOhgJKwwMJhhcZqmPGUFPyq9
         p8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        fh=6bwU7OMcYG5rVzxvpqmXrMwEZCnvkOMEGUubDg/3ymI=;
        b=PKb93NL8COLv5oYIH9P2HpECXVWiE1cf9nLpBwLYpj0uw8pXj/YNvk/sPvivYdRJE0
         Y/m1MqFzcUdBpkWyzQuksDmOshxct2wn8LbqlIvDPztReuGaWMZCri/Q6E+dB05fwEVC
         WJs1cjQJc31EZ6JT+i5VCE3iIF4ISh+F019KnfFyZ8T2xLN1yqex/csIGasl43HAS/+C
         WufgxGVZK/DG0iFXHRookUfUd7gHmgSxdmZDqZEhbd5ns15Fm+he3v3PX1r+vc3UP9Lu
         4+zM0FxG7U7EBJvZJGuo9qgPH7swidw/HjLTE8PV+DTqNImAa7lrNS9EbgqjmJocaMqe
         bJzQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779837710; x=1780442510; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        b=IjbisMCyHHaOTMObJ8rRqf7o37IhBvSJhF0xHjmOwSaQIZ+0L1MncSDfs8h+M8G6dh
         u469rSLTjDWFcnk/dV2DnLdQgC6kMIolUMNCXmyKgwcALGN4giFBVmjhLmMRr8UY+FDl
         VwEER6NG3T6/Nc4h56PclcUx7xTfNhqhh7gkcjDde2r7Kg7/AvOmbwriXf2EXmud4Aqc
         SMEjim8D8T2G2LApAlcWwUTGcqvwjnm+9in3V3XH0E12qUD1/mf5WkIDxDweQevnhjhu
         dv8lymkh5Iii/F9OK3im/jQuUa+FMFrJsPXAOgvGaMvN9ngYHlXJfh+ZGIrFcswSbT2Q
         APHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779837710; x=1780442510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HujuVBuKdWWEfICM8n6u8a8X3rF3iweG2fpAlmRVj68=;
        b=ae8UEfFFep/bxr7F1U/SooIvG38/W8iRJ+INpnU3zWx8KhkLntj3HSJFlqxkpA4lwY
         prvw5Oz8zrs1hAJ1Ta/hGkG75ntRAXtETYkWJ4Gg+0gcaq+dfS67GBxvPF3JqGGNDJtZ
         4FYlIaGkQaCRPP4R4xhdTx2EtPsNa2je5k5DFREIPw0XmbQ7F3IL+u5StvZUY8gYX5zB
         mNtdks7qRUvemgJJ5m8jy8sR0JHAcGvl+ScGGqHVnNQlct4T2PDP/P4fmr4wzYCSq170
         vyA6VjrK6R4SzcnSnP/zXPUZMyRwzJwN4EfMtVTUR4cM3laDkZp3ksLiVstPT6X7g76f
         uWXg==
X-Forwarded-Encrypted: i=1; AFNElJ/OVbkF2Nd18rjlvB/bk/lIHsLDVtx3m+YAqf6clZ+J1ybqFIe70y4FFEGNFT/xIZE9cTvz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7YvlzUHPOoM2NYDxUiLJqRWQmAJEpL8KcZPTCSOeVfaoUF+rA
	QsInkbQ16W+9l9TPoU1vyyk8ShR/pYX7LSiQwJ8+h017SBLRV1DyH8kpIcWKQFZnDX7ygNKN1HA
	uRJLg2lnsirVLthdCQse8+UAa4yZGk4w=
X-Gm-Gg: Acq92OEF9jpY09QBLTHmvRwLvnOmyc0JYLM46mWTfwbmPMQPUIrF6rX9ty/J9fs3Umx
	Eck8YI0mU/nYbcnyvRz8pqr3tMxuQ7o4QoliHf3wIXWhl2RK27i2bhvkSqVmFCdKbqZMKXygr65
	Nwl5ADgtC/qi1WweL0u+Mr7Uuk/KbvkzpXcj9L/CVT0LCNax3gve/XbFugTT15C5291phg0BYMj
	jojc5t8TnyuwdNEkrakUVy6rIpzIrYKvMXgnF0pL4QjcvX99PYt7KZ+Ad3lMeXzE/zxlXOkoyAo
	6rYVnTfaRn5BRLIKkrsoLav87R0=
X-Received: by 2002:a4a:e903:0:b0:694:9e2f:cfac with SMTP id
 006d021491bc7-69d7fcb51b6mr8951696eaf.9.1779837709977; Tue, 26 May 2026
 16:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525201116.407338-2-kacper.kokot.44@gmail.com> <202605261807.YY0PWuhX-lkp@intel.com>
In-Reply-To: <202605261807.YY0PWuhX-lkp@intel.com>
From: Kacper Kokot <kacper.kokot.44@gmail.com>
Date: Wed, 27 May 2026 00:21:38 +0100
X-Gm-Features: AVHnY4IeURuAw-7kug8a-6xqNpmP-8aoIQEcxEzrITr5eMpT52Lzw3oZg7lhaRo
Message-ID: <CAG-Fur7edB8_4iLnP4QWh+K96bGFBgYyfdoy8H7zvqa8NYdyow@mail.gmail.com>
Subject: Re: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option is unaligned
To: kernel test robot <lkp@intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> AFAICS, these issues are not present in real environments as MSS option
> is placed at the beginning of the options block making it aligned by
> default usually.

I agree, I haven't observed it in any real environment and wouldn't expect to.
I found it by reading the code and had to craft a SYN to reproduce. That said
the spec permits unaligned options and the kernel shouldn't silently drop legal
packets just because nobody sends them today. I can note in the v2 commit
message that this is a theoretical fix.

> > I wonder, if we are touching this code, we could use the opportunity
> > to make it use get_unaligned_be16() instead.
>
> gcc and clang convert x[0] << 8 | x[1] (etc) to the appropriate single
> instruction (and maybe byteswap) on cpu that support misaligned accesses.
> So there is little to gain from doing it any other way.

Happy to go with whichever you prefer for v2.

> and, of course, the code works fine because 0x1 != 0 is 1.

Ha - accidentally correct. I'll add the parens in v2 tomorrow.

Also the reproducer I sent with v1 was clunky. Here's a better
one with some results below:

  #!/usr/bin/env python3
  import argparse
  from scapy.all import *

  parser = argparse.ArgumentParser()
  parser.add_argument("target_ip")
  parser.add_argument("target_port", type=int)
  args = parser.parse_args()

  def gen_mss_syn_options(nops=0):
      return nops * [("NOP", None)] + [("MSS", 1460)]

  def syn_check(opts):
      sport = RandShort()
      ip = IP(dst=args.target_ip)
      syn = TCP(sport=sport, dport=args.target_port, flags="S",
seq=1000, options=opts)
      synack = sr1(ip/syn, timeout=1, verbose=False)
      send(ip/TCP(sport=sport, dport=args.target_port, flags="R",
seq=syn.seq+1),
           verbose=False)
      return not not (synack and synack.haslayer(TCP) and
synack[TCP].flags == 0x12)

  for i in range(7):
      n = 5
      ok = sum(syn_check(gen_mss_syn_options(i)) for _ in range(n))
      print(f"{i} nops + mss, {ok}/{n} probes responded")

Before:

  0 nops + mss, 5/5 probes responded
  1 nops + mss, 0/5 probes responded
  2 nops + mss, 5/5 probes responded
  3 nops + mss, 0/5 probes responded
  4 nops + mss, 5/5 probes responded
  5 nops + mss, 0/5 probes responded
  6 nops + mss, 5/5 probes responded

After:

  0 nops + mss, 5/5 probes responded
  1 nops + mss, 5/5 probes responded
  2 nops + mss, 5/5 probes responded
  3 nops + mss, 5/5 probes responded
  4 nops + mss, 5/5 probes responded
  5 nops + mss, 5/5 probes responded
  6 nops + mss, 5/5 probes responded
