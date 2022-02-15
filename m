Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952687C
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 04:16:33 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id g21so8552848vsp.6
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 20:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPSye3DP/aFMtQWU+DcD705eQqcCbNUk8oNVOh77QSE=;
        b=AoFMavfC/VlDk5aFgDQJotxl1ztysH/sXAcOoinln3hBw8Pdv0uLD+H+iWhPL9KiTK
         aMVfYd6GdURq5JYLbTmPVcOzyBZLeIob1xqQFJ1x+TNQ0RgEYMg+NyTE7rSe3yZW7fh/
         zxDPNP0Z7zQUxzhg8WsTyZt2m8dgrGz1n1T0OMPbsUr81VLFfeJZtAMFPI7xDrJbSIaV
         Lw1hVXz4TuLLQ8ETlG+4SKp4urQM1N3gPtOxigrySdv7N5C1alNttEyEgn/9m6HGG0OE
         h1rHtGgn2IBIkJWuoJJA0TLoBoa2MY548/b1DHdo4RGGZQEJiZ/rXu0oB2i0W03iIG7L
         07bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPSye3DP/aFMtQWU+DcD705eQqcCbNUk8oNVOh77QSE=;
        b=qTFzeAaRZefkiogqsKO4s7LNTiEK3Qc7lgnD6klYRp0kaO5/JkqczR9vqHgqCT3jFo
         JK8wqBuNBCNe/J2NSXKYg87T+f2c/wcMSL6dbAjLwEHDcjvtPEINcSQKV4sjePQFRiZa
         jdbGIg+bzu4oYsrQ7hEvCLm+SN4bNq6RiiNX4RLTT5dqngHbUCnFzujhh/kRNNBnXndS
         8DhOUMOJMm/vzy6YbXCPykZrbIUC5XWscvLQjqPIsVB/s7Vr8AJqEGziOrKkCx/H/6x6
         nMqssM1s53Mb12MQ/DUah6IE3BALBLiYsHudYRs6vxa9Cs3S/7AxI6pwS2qVTWED6BzB
         5z5A==
X-Gm-Message-State: AOAM531JZ06ZECnYGuPGWg1sFVCJC7SyUmme8CANHXYCnA46VFSCIvpT
	RqiY+dHQfI1zwZ0rguM15DqD1TqBJv4=
X-Google-Smtp-Source: ABdhPJyygy8YyAaYgbz+3F0jyiyzd3OSiLw8bCKkZUZ6luabTqSnEg2kR49vNlvgmMlQfp0s6UmQdw==
X-Received: by 2002:a67:a60a:: with SMTP id p10mr743375vse.65.1644898592539;
        Mon, 14 Feb 2022 20:16:32 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 4sm5790850vkx.4.2022.02.14.20.16.30
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 20:16:31 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id e5so3775089vsg.12
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 20:16:30 -0800 (PST)
X-Received: by 2002:a67:d118:: with SMTP id u24mr765733vsi.35.1644898590656;
 Mon, 14 Feb 2022 20:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214200400.513069-1-willemdebruijn.kernel@gmail.com> <202202150837.bGbeRjWx-lkp@intel.com>
In-Reply-To: <202202150837.bGbeRjWx-lkp@intel.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 14 Feb 2022 23:15:54 -0500
X-Gmail-Original-Message-ID: <CA+FuTScqkbST6PZAfZ0brq04+26kCkvhgG0uYii2iPDeC5MzXA@mail.gmail.com>
Message-ID: <CA+FuTScqkbST6PZAfZ0brq04+26kCkvhgG0uYii2iPDeC5MzXA@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: per-netns exclusive flowlabel checks
To: kernel test robot <lkp@intel.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net, 
	kuba@kernel.org, Congyu Liu <liu3101@purdue.edu>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 7:19 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Willem,
>
> Thank you for the patch! Perhaps something to improve:

>    In file included from net/sched/cls_flow.c:24:
>    In file included from include/net/ip.h:30:
>    In file included from include/net/route.h:24:
>    In file included from include/net/inetpeer.h:16:
>    include/net/ipv6.h:403:30: error: no member named 'ipv6' in 'struct net'
>                READ_ONCE(sock_net(sk)->ipv6.flowlabel_has_excl))

I'll wrap the whole function in IS_ENABLED(CONFIG_IPV6).
fl6_sock_lookup is only called from code in .c files that are
conditional on CONFIG_IPV6.
