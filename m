Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34035F47B
	for <llvm@lists.linux.dev>; Wed,  6 Mar 2024 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709715665; cv=none; b=oO9a6X/aKm/7z4qZVn8fbuIPcSKw3UAolILDmkl9ZqpXKMW/LmJ36/t/vVF1ot1DQuajheBcupNOqtDXw5VL7z5ma02oX6zkpNEG+QZBE/3897TKNg67x7XlPdWKPs2JRTzwM0c3lpEaLbmDb44giBvpb7GIQdi0vANztA/MjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709715665; c=relaxed/simple;
	bh=EwEYirvr2jvVvnPjdV6XVx23jWr+FeYoGMbUr8oZySw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0TCGFoGdvWURUE1qIAm0s9VsUF/Mhoq5aMtp0/LLgAIrHUQxgNoeFwYM9veYnMqU+RR2vxAt9baezX9+krS4oSp/cKw25HzKCG2VBwACyIaqXHgIF8ClwOwJU9Ogd/i3yU6NSt9SHGrFuPggiNJO42rch1WHcYJiwYyqHG5Hmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UHWK9Mdv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHWK9Mdv"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565223fd7d9so5660a12.1
        for <llvm@lists.linux.dev>; Wed, 06 Mar 2024 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709715661; x=1710320461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/84T2ki3/neNxXjBVi8YXXkmoruSAbtUGVHX97k3rw=;
        b=UHWK9MdvMo2v/7AG5DtbFw1Vq75ipdbbiDY3/HwHjXHq9lEkTJWr53xmCBBWMadbNG
         bQFVs3J7pkFa1WeQaT9+nQPPihITKgDlWJSySyphwEJZ3TkFq8229kgrh9OS21KMDCrj
         YiRf1ll5NOppCEXQ9lrmgHnl9bI0F3Y95zReZrDiBjUH0kskqbxBrN796t+ovQ5h2FWn
         jA52bqKLDw83ADr8WCrKKe/8ys1jlKe1ADo6juQcKThbvfz01VG1aBMzOqPYGXov2zf3
         ABQdIqgwum3hvfok5uUJpUmpWtB/8uVMA60RHLjjeovNeBXsB9cETHncFgy3OBSMG13c
         ioCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709715661; x=1710320461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/84T2ki3/neNxXjBVi8YXXkmoruSAbtUGVHX97k3rw=;
        b=C6AeesZWl2if922ptbN+3rtWykwoHDi/ktwhd9iuexAI+R9fPrITy+MrQarWgRhXRr
         ee2/tLnkYMYZBdEKNNopId6M3UkcY7PzgpcmiFqOWw82+NbJDkhNZ2XFCwneVs/38nRY
         y6kw1AdryQZxTDz9eU5P2Jqt4FcmCE4+Dqv0ugOCfp47o9fqXkeiXcLKxOonxUTTlHw1
         ZdOgrc4uc21ODl8Dzt8YOT5HwNSUx7mnAWGu/TbwIxbP77vJd3wNdZIcdp3o/TCBtBNL
         i652ZJa0Br+PAV95DgZ3E/UuD6IzutyY6Svx2v8ORGEhHPJpThP/syT3aTZAD17d3ABQ
         2g7w==
X-Forwarded-Encrypted: i=1; AJvYcCWfGekmgXAS4a2guaSBKvzQU+5kgYHRTzbYk/9Q1KPD5SWoqYpMT+0PyEURD8R0xmatsf6RCN2iots8eEV21ZqHmk6gNw==
X-Gm-Message-State: AOJu0YyDx3cPyKfWbWw4tMxKS62bkN/xUe7T6DeYRt6ZKKMEKOtblxBE
	0fu+qsy4j2rZQRB1S59zKIEpXGiqhI84MtWAqFWA964kcKxFiao1WPdLAhrvo/CCyb6Y5j5X1jY
	NsyHZAJtBrp82U6zTwapkWZ0R4nk27oo4pLnp
X-Google-Smtp-Source: AGHT+IE90eLXuQ/cn4OIYVYGWBfGpFwg3VwdIkidZ6fkNjkHdVuNbVDF1f16qE2ZvMGwmAXb/EBfA7GbXH+JtNTmDJY=
X-Received: by 2002:a05:6402:11ca:b0:567:eb05:6d08 with SMTP id
 j10-20020a05640211ca00b00567eb056d08mr75504edw.6.1709715660520; Wed, 06 Mar
 2024 01:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305160413.2231423-7-edumazet@google.com> <202403061318.QMW92UEi-lkp@intel.com>
In-Reply-To: <202403061318.QMW92UEi-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 6 Mar 2024 10:00:45 +0100
Message-ID: <CANn89iLv8hFUDiash5LTaHg4VrzCS1QdaJR-62WNEmMVYVF7pA@mail.gmail.com>
Subject: Re: [PATCH net-next 06/18] net: move ip_packet_offload and
 ipv6_packet_offload to net_hotdata
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, 
	Neal Cardwell <ncardwell@google.com>, eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 7:09=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-i=
ntroduce-struct-net_hotdata/20240306-001407
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240305160413.2231423-7-edumaze=
t%40google.com
> patch subject: [PATCH net-next 06/18] net: move ip_packet_offload and ipv=
6_packet_offload to net_hotdata
> config: hexagon-defconfig (https://download.01.org/0day-ci/archive/202403=
06/202403061318.QMW92UEi-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
25f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240306/202403061318.QMW92UEi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061318.QMW92UEi-lkp=
@intel.com/

Right, all the offloads need to be there if CONFIG_INET=3Dy, regardless
of CONFIG_IPV6

I will in v2 have changes so that the cumulative diff is :

diff --git a/include/net/hotdata.h b/include/net/hotdata.h
index 7bb6e46aec8f19deff42112041feb47724cdd538..9230052a453c1b959b9a72f1d1a=
4878d76f243b8
100644
--- a/include/net/hotdata.h
+++ b/include/net/hotdata.h
@@ -14,13 +14,13 @@ struct net_hotdata {
        struct net_protocol     tcp_protocol;
        struct net_offload      udpv4_offload;
        struct net_protocol     udp_protocol;
-#endif
-#if IS_ENABLED(CONFIG_IPV6)
        struct packet_offload   ipv6_packet_offload;
        struct net_offload      tcpv6_offload;
+#if defined (CONFIG_IPV6)
        struct inet6_protocol   tcpv6_protocol;
-       struct net_offload      udpv6_offload;
        struct inet6_protocol   udpv6_protocol;
+#endif
+       struct net_offload      udpv6_offload;
 #endif
        struct list_head        offload_base;
        struct list_head        ptype_all;
