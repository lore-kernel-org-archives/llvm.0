Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63A187C
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 19:55:20 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q17so5826543edd.4
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 11:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PD6yzCgOYpWVSwenJgOD3M2UZqs8pw6XfrocvAB3tzQ=;
        b=LW13VbLkwTWAZedb390gkobGLU9vJgjeSnIV+ZGYVYe26PJNMm7yXL4LjCeRv2Lg5X
         W1OVyibLduGH1TDCldY5uIkkMCuAFmSwwAGrATLjBGM0rkV4dNZCciBzlAs9FXJuKDzt
         a42VB6GOtSAAKARxnXVWWoLUa8+9hyJ4JFq68f8CkQZi+HBNlOAEIHfuZ6a7AUBVDUaq
         P+HFnmIABQejUZFNDj7/CgtECH8x/GOXxItG8tdmFPjy7F0qmfaoeiUOX331JgeRwjXN
         9lp+7kiN29bFKciIhvtQ/UevMttvbRBSn3bk7zRUeEeoe89Oxzae9a0UaHgJyO+rKtUo
         wEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PD6yzCgOYpWVSwenJgOD3M2UZqs8pw6XfrocvAB3tzQ=;
        b=mXK8QV+LMdVaMwp+7PLiZV3HfWl0jftlCVvntNqcd9A6f0Coh6feoOdtOKgBBh1DOS
         w0Scls+jvO+JP4OsfUc5Aq7uiFLjosCFS8euIhiEKHi6B0Yq3WG6M47sb6rpolZboPqA
         xuk+1Y1eLkMB71bo+Ihx8Tlk3NQzRKJxGQ828twMr5ExCtWcay2kwJEpiyicWpZmdS89
         bI9X0ppRnhgzxxzSaGU+/6C9fqW395nWcPHyrEICT+sgoFqgjryI1+aK4hLhbZ+PCuHO
         dj6r44zNGnitR8NWjEv6ynjjMCYY3O0PAi82iINzvxf41ylq3k8OZEl42umn2nmPh+l0
         nR1w==
X-Gm-Message-State: AOAM5327jaXLHMittFo6SopMuj+Ao1wghWFm1VG6T4pfGsgwZdRrIGzt
	EfMjVDrodEPe21AAHTe9O8E=
X-Google-Smtp-Source: ABdhPJwzX9rXztPm8dfsc3nzWcIwAAE+AuY4iJwnmgmrnaoHyGFSukZqgjH8Mhp/D9pIU+CXifMmyA==
X-Received: by 2002:a05:6402:b62:b0:3e2:a75f:b949 with SMTP id cb2-20020a0564020b6200b003e2a75fb949mr4770157edb.62.1645041319061;
        Wed, 16 Feb 2022 11:55:19 -0800 (PST)
Received: from skbuf ([188.27.184.105])
        by smtp.gmail.com with ESMTPSA id z5sm284783eja.20.2022.02.16.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:55:18 -0800 (PST)
Date: Wed, 16 Feb 2022 21:55:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Mans Rullgard <mans@mansr.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Juergen Borleis <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, netdev@vger.kernel.org
Subject: Re: [PATCH] net: dsa: lan9303: add VLAN IDs to master device
Message-ID: <20220216195517.o6dk64gwoe4sizl6@skbuf>
References: <20220216151111.6376-1-mans@mansr.com>
 <202202170327.RiXqUeGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202202170327.RiXqUeGc-lkp@intel.com>

On Thu, Feb 17, 2022 at 03:33:39AM +0800, kernel test robot wrote:
> >> drivers/net/dsa/lan9303-core.c:1095:2: error: implicit declaration of function 'vlan_vid_add' [-Werror,-Wimplicit-function-declaration]
>            vlan_vid_add(cpu_dp->master, htons(ETH_P_8021Q), port);
>            ^
> >> drivers/net/dsa/lan9303-core.c:1111:2: error: implicit declaration of function 'vlan_vid_del' [-Werror,-Wimplicit-function-declaration]
>            vlan_vid_del(cpu_dp->master, htons(ETH_P_8021Q), port);
>            ^

#include <linux/if_vlan.h>

drivers/net/dsa/Kconfig:

config NET_DSA_SMSC_LAN9303
	depends on VLAN_8021Q || VLAN_8021Q=n

and maybe you can access using dp->cpu_dp in the next revision.
