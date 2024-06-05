Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C15DDD2
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717615924; cv=none; b=SQaPvosHtqClLYYsNgPiUtkPPvwlIZ6t34WQUvoxjgaDzs0Jo979U9ndt31JUJxC/g8RDczfDiUdizGbTVsa1ijt4BQ+/DHRcKJrIDR+2DNwUeGVNoj0a+oQv90FlvDKbh6CBUauVhZ5MW2GgoJU3AydzdCkWXQ0oNSatW8mjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717615924; c=relaxed/simple;
	bh=m0CXhwJL3QSo1uinEHiWUBm+QL6SC5BUk6YFU+VFrX4=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8aztSujy7YZWHCX3gmwiCe//0c8PXKNXP+CSmXKu4vvlhWIUC8QMBbRGPVHL44NhoJdL+Hydxv2cae6dSyIWK5gzhZh/ttHMZBm9lHE3QnfGh3jVaz+RsEntuCeie8Cc1FCxqkq2k/+Ws8py9uLhzT4yjCH5qMar4MSNiwaDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KGt7JhRk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KGt7JhRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717615920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAUzjKjHQT48MT1CEnySduYKvPnHNLGmCrzOZbluMf0=;
	b=KGt7JhRk5KQBKVwEiR/yhyMJhBDGGYg/2fgf0yn7Dd7UeqRcD3DDt2GxQEKBBdSoLqHM+H
	grIU8XMM6sIeuS4Ws2PVFDrJejMu9TzNwKoy0M0fTbv1x5OFnGqupmxki3xe670WOOAuqN
	S6p98ixmFsXdWUfLUbJEbkkdRGDpKvU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-6jOILh3nP7-70yMF-qCoYQ-1; Wed, 05 Jun 2024 15:31:58 -0400
X-MC-Unique: 6jOILh3nP7-70yMF-qCoYQ-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5b9b37de6e6so81837eaf.3
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 12:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717615917; x=1718220717;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAUzjKjHQT48MT1CEnySduYKvPnHNLGmCrzOZbluMf0=;
        b=E/XDAx2ENenC5ITD8PYuSsuzEUbSxTK+U2TwKG63BoWMGPgm2t7ZGLWKHYzi641Y7w
         zpe0DLf0pEnC0V/6P7TJZl2mf5PMgCIzhU8/kQH6meBzhqa+Fw3s8Bpo4rzlPtLIbujj
         l7C3OTQFGznZcui4/+wOHrKTPpVde11UXK7Ftuyndsk0DGdulbLmEm9Aws4FZjHf2Vz+
         cJYzagyrPcJTAlPjf9samXro5C2ZJ32hPYb2+yyqIHswtzHtukSAXdsC99GESynhHLn4
         ZgL8xVYzaRXTZR3lBs5FfxBZY5rAZhpu/E5NJRyuZ4W3yAgcUTSyFD70tfWu9Oyf7VVC
         rtOg==
X-Forwarded-Encrypted: i=1; AJvYcCVbnoXi90Zmetbi8W+wgstPmFj703XLgX3GYhUZA5FeX/397ZBGd7VMEDNdagzUpAYc8xtVX5+1yl9KUxBhDgM30Whf2w==
X-Gm-Message-State: AOJu0YxJNk2TI0yFKMRXlDCjOMF8MdWzoUX7AMpOw4FgXjTLcP3wiyOu
	l0mr85yZ/IY0/KzdakH2h+Ua7KVk4DRgEO8mCOYH+JxakTxAL6qX090W2yOielaMrlbOXaqvl2J
	mYFiII9VgHJCPSnfB8JbuzFQhm+p72mZapiE1aq8T70XL750L6GJ//CK+pTIyWESnZXZVtMz9Tl
	1gDQn/0huOUGAx+shr+p5U6tji7g==
X-Received: by 2002:a05:6359:4103:b0:183:612d:44a1 with SMTP id e5c5f4694b2df-19c6ca19ed9mr443019655d.28.1717615917163;
        Wed, 05 Jun 2024 12:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqzqeFCvtmsiZCw2U1K3HXxO/IPPSvtKOjW3/Ru2mn4jCUk47tlrWhigUB8CObse5CiTfalvEzZeA4Lp6TeH8=
X-Received: by 2002:a05:6359:4103:b0:183:612d:44a1 with SMTP id
 e5c5f4694b2df-19c6ca19ed9mr443017355d.28.1717615916756; Wed, 05 Jun 2024
 12:31:56 -0700 (PDT)
Received: from 311643009450 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jun 2024 19:31:55 +0000
From: =?UTF-8?Q?Adri=C3=A1n_Moreno?= <amorenoz@redhat.com>
References: <20240603185647.2310748-6-amorenoz@redhat.com> <202406050852.hDtfskO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202406050852.hDtfskO0-lkp@intel.com>
Date: Wed, 5 Jun 2024 19:31:55 +0000
Message-ID: <CAG=2xmOQBaUki43jpUnP7F-RvkxXroQ46_CuXvbQyps=MvvYAg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/9] net: openvswitch: add emit_sample action
To: kernel test robot <lkp@intel.com>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, aconole@redhat.com, echaudro@redhat.com, 
	horms@kernel.org, i.maximets@ovn.org, dev@openvswitch.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pravin B Shelar <pshelar@ovn.org>, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 05, 2024 at 08:29:22AM GMT, kernel test robot wrote:
> Hi Adrian,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-psample-add-user-cookie/20240604-030055
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240603185647.2310748-6-amorenoz%40redhat.com
> patch subject: [PATCH net-next v2 5/9] net: openvswitch: add emit_sample action
> config: s390-randconfig-002-20240605 (https://download.01.org/0day-ci/archive/20240605/202406050852.hDtfskO0-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050852.hDtfskO0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406050852.hDtfskO0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    s390x-linux-ld: net/openvswitch/actions.o: in function `do_execute_actions':
> >> actions.c:(.text+0x1d5c): undefined reference to `psample_sample_packet'
>

Thanks robot!

OK, I think I know what's wrong. There is an optional dependency with
PSAMPLE. Openvswitch module does compile without PSAMPLE but there is a
link error if OPENVSWITCH=y and PSAMPLE=m.

Looking into how to express this in the Kconfig, I'm planning to add the
following to the next version of the series.

diff --git a/net/openvswitch/Kconfig b/net/openvswitch/Kconfig
index 29a7081858cd..2535f3f9f462 100644
--- a/net/openvswitch/Kconfig
+++ b/net/openvswitch/Kconfig
@@ -10,6 +10,7 @@ config OPENVSWITCH
 		   (NF_CONNTRACK && ((!NF_DEFRAG_IPV6 || NF_DEFRAG_IPV6) && \
 				     (!NF_NAT || NF_NAT) && \
 				     (!NETFILTER_CONNCOUNT || NETFILTER_CONNCOUNT)))
+	depends on PSAMPLE || !PSAMPLE
 	select LIBCRC32C
 	select MPLS
 	select NET_MPLS_GSO

