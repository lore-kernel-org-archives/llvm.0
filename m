Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2941DE8A9
	for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741640304; cv=none; b=Gco0ofMOm2QunlWxvM6oyMluhXYxBFog3rtd3tGz6TRq7jpJ1VGLx4WRAzEGW9te4j4BwjioOlP2qxxOhkoqQ70WxH0yWXSCQCXQvYV9t6Tg6RdxsWjWB22rbbF8rn+okClT3ja+rf6/awhqhUCbySn4Xm5thQrWOS+roA+TQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741640304; c=relaxed/simple;
	bh=udnmpgjnrnQl/r5rpuVE/OrzhYTIVnFvDMbBeWMLMt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Al2xkGPQ27oSKBO+mGq+Qd6pXHFoHYiCUT78nnbZxq8ZfROx+KH1uFnLnFjRxVSlVlks/xO+6U8xbrAErJO9djDME47OacmYEkdBOfi7rqjabOSMZvrEibIMog9YrAAdUaI4ACE4WAwsu9UqyotQ39xckSNv/ba37dwAjekNujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pk9G0e5h; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pk9G0e5h"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-474faf23fbeso58278481cf.2
        for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741640302; x=1742245102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=totOKg+C1RLLbJLz2a3eJ20AMHYupd9oISI8Z8SOtSQ=;
        b=pk9G0e5hN5ZLmYc/lmJUuE4g2UW6laTmein+1StzqE+wWJVd2tNwgDmEPxGXv54K1p
         zuKGblpVH3v+KdrXO9nzzKbh688A5BMgER5C8pcD9TXj69ybv6G7mjpN8xyFNK1n+rB2
         RAnj2MqobfZX5EFUnqBWMICgTgfwdGYwgoCPpuRWjtyS6mM+iHApLbDAbKGmFlwHpG8x
         Lg+KCKUg27DFeOzAMzY6zyTfCKrNPUckfwrKBib/2RTWynvbPsKz8lFrg/MBAdcWVKkg
         oJZjNyruZGcwl20mKveGmcEy3yaee/VJIdEtPL0pLjC6ShMeyLbCB+MrG5GAAWja85sO
         qO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741640302; x=1742245102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=totOKg+C1RLLbJLz2a3eJ20AMHYupd9oISI8Z8SOtSQ=;
        b=vvAOdSi4TVyxBIc1LWg9ekveawyfH1MB9APobZ1uH4VgwrOZbj3BpVIUKLWdi8Jfyn
         1roWdv5IevDmh9K4DROIwFWA0TPP3edO7AYE9PekFJYZ/FpQBzwena1yzMTIRfU/378N
         CR9f4HlPOovxhNxkP4Dyicr92myqfHneD6O7hllzY+9BWEvJQCJXxsWWOA5PD3szJrG8
         3ruyxBfJ/SEPvjv0c4NhtcfZnpRY0T9zkJVqHBn3yer8osStf0yWOHOHSW51lftMyWqy
         DZ10Taw55xnF/vBSWYtwqqm/40k0veFgOOxL0cMuoN6IntKSncIszFVjJnHyCnYaX4LX
         lbKA==
X-Forwarded-Encrypted: i=1; AJvYcCVzxRcwq8lSnuaVqT2VwgB+43RGGHRzIyNUemBGwEW7fAZhfUL50CStXkYEo3fkARpVnSZo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7gOQa7/mbsqVuWU7R3FQcqXBPsa/JXlzJLqpceMmNeuf/RxNA
	FSvcl5lM2H81q0XyShJtl/OGN6BHunNCRKQhdm56SoRkKNiNjwab1rK+VeODLFSs4LgXFFq80vm
	t9TgEFIszgemmoK39L+bnZEp/nF1vPSF6NGg+
X-Gm-Gg: ASbGnctVQZgoUF6ELmXk4U/kzWD+aqLFTREQgRkk0Z86zY/9H9MXszkJRez0Bn+p6BX
	t+pq8dEpREWhorFpinlsYXcipYOCzIzSZgaPvZt7phowF6frqRDmYRYwvMQ8xB6tdMt5THGcxiY
	pORdhSsVRzyY1pWQ6po9wKOpl+bQ==
X-Google-Smtp-Source: AGHT+IH32RBY3KE7CCJKADAXBwm53mo8Ml+vwI8WA7zOwPhLmxmL957w5eo9+eN8sJUuoW1tyGYSiBsYTS0PSCwGitE=
X-Received: by 2002:a05:622a:209:b0:472:a26:744c with SMTP id
 d75a77b69052e-4761097d371mr197610591cf.12.1741640301788; Mon, 10 Mar 2025
 13:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250309173151.2863314-4-edumazet@google.com> <202503102308.1uTA6Uxr-lkp@intel.com>
In-Reply-To: <202503102308.1uTA6Uxr-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 10 Mar 2025 21:58:10 +0100
X-Gm-Features: AQ5f1Jr884G35uQURzTyL3LRgOkMXY0Q1xmhME8uTd8nuhV72EtVWUaKfRfW8ss
Message-ID: <CANn89iJqKH8A9+pq_i0HWuhqfq_1gkNCzfdv7=bUQy-cR=msEQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] inet: frags: change inet_frag_kill() to
 defer refcount updates
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 4:57=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/inet-=
frags-add-inet_frag_putn-helper/20250310-013501
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250309173151.2863314-4-edumaze=
t%40google.com
> patch subject: [PATCH net-next 3/4] inet: frags: change inet_frag_kill() =
to defer refcount updates
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
50310/202503102308.1uTA6Uxr-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e=
15545cad8297ec7555f26e5ae74a9f0511203e7)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250310/202503102308.1uTA6Uxr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503102308.1uTA6Uxr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/ieee802154/6lowpan/reassembly.c:312:45: error: too few arguments t=
o function call, expected 4, have 3
>      312 |                 ret =3D lowpan_frag_queue(fq, skb, frag_type);
>          |                       ~~~~~~~~~~~~~~~~~                   ^
>    net/ieee802154/6lowpan/reassembly.c:86:12: note: 'lowpan_frag_queue' d=
eclared here
>       86 | static int lowpan_frag_queue(struct lowpan_frag_queue *fq,
>          |            ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       87 |                              struct sk_buff *skb, u8 frag_type=
,
>          |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
>       88 |                              int *refs)
>          |                              ~~~~~~~~~
>    1 error generated.

Interesting, I thought I had compiled this file.

I will add the missing &refs argument.
