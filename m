Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF53B222586;
	Thu, 20 Mar 2025 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742464903; cv=none; b=c+BvsFn9aw4jzvTU5/q7ryzm56Nq2q1VnED+JlUQxGZPFWkqYGXekPwcf0qUiRgXKps55eDne2czKGW4GXV0SJkwo01kcYHN6w9ocwSM75PTpfczdW994W6SCMp9Dg6vy6qvyH2HjEYzFBNiZPxIQficwJEpQWLdBpzgkjj0gVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742464903; c=relaxed/simple;
	bh=3uEhFvWgTZ3qE+HGzh3HTAH18SIHho193NXFHIRXPSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kfrj2ufM75izW7VYWKyXHI+Cfao2G9Nua8LniYQ+Y5Notm2ExVDFpBlq1Ftt9g5XhnrDRKT1wYq07Wxi6khVm6uN3AnluQyZ0bMPycjb4n1kgQnGY9Augxv2voeE5/AxZ8ACJo93A6R+yKpWSf7H/QnZ4lBTfSJWm8iUfAz/vis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd2b2Icz; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd2b2Icz"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51eb181331bso305205e0c.0;
        Thu, 20 Mar 2025 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742464900; x=1743069700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkOqX1hHmiQ4/Ww30LXv9z0S90BxKz274f5FP6A6x7o=;
        b=Bd2b2Icz6XzlUhs3iCL5IJ1Bp9oban1RTMTRk17k3qkmn5PY5zybGXzvPPBTRvAIcH
         +X3E8CrBbRB3bg27SVBNg5T3LJgUFj2bICHiML7WfW50Fsfue8o90u6Z0e/xM1i4n3UZ
         aVAMcxdbCb0lAnUTI952s5w64SugLk58RCx3rwaWRchJ1xzDvSYd6mB0J3zq6+rf8l8m
         1LD4KYYO7843eOJHkVIqddNEveikGE9Iz5Un9O0QySS1GWnQ8THLxH/FmFcRTfTWzM2N
         6hdlwqavDPluGLjBbQqS/oS7YqsVFSyhC3cOoqcxhz1D4aOdGu3yK4cTk0YeHGDc6pNo
         Do/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742464900; x=1743069700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkOqX1hHmiQ4/Ww30LXv9z0S90BxKz274f5FP6A6x7o=;
        b=CCPvpqqjO9lvbthZ+da6gzgXklqFglvA5IjUtL2PMTBeO3fgeAXxJ0kwPNcEKleM16
         QCxT1ksG0Nn4ZXZMN+mlSmcdG4lH2VkmD+RjBGjerV5W5sp1cjWNhyWdgOg91QmA9DE2
         crqoctYG9INr8N0h3mWQ/Y2FEY8aCjmXmaurrbWNhnLK6ixhrFfNZPbhXNZHahYIiRc3
         tVbvS9dJWEcGGI2qTrq2oncGRkpj2kC98Cn8kfR47Hg4qZR0klcRYsnN+l9JKeru+cse
         mieEITCiSBM6BdiSW7AszfSLhp6M553PZjO9S3qPlyUsdRaTaZKZ71ZLSxZP1LLk78Zl
         PaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOnEqR1jCRnQBfOhMgxMwlxcGv5h+UhQoE08X96/bJxfVemfvm082PJ+p1E626gFWx511ya//YGsi1QePGzg==@lists.linux.dev, AJvYcCVNwH0Dvg3gsnWbiw8KUToBDi8E0kDMk7Awn0QL2awX1mc7I0DSACFYy4jc7UX+/hYGuMaU@lists.linux.dev
X-Gm-Message-State: AOJu0YyFQKJnp+bU2uwebOFXkBfSSBRPEjs/HcBAgota7jNL+lzU984R
	hXcLVYAtCLTahu1KBq3pbV1NpAVdPfqmK+DsZ0u7lpxN6hw5nCpt2RIFuM221qgeoswFcd/yZx7
	aoBfRWq8J64z4thi8UzjzcAlPHCE=
X-Gm-Gg: ASbGnctHfdQmtFDYqsKo3YlZWZ7QKKCWmB/QHsYPFCsv9P6qcBHKUyuVffiktPFLM9i
	DECgFP/5nH7bKNiChtqr0ON54C1d6Lp2BsRp7pG5u9jJQ/0YqApR0OLmy5Tuq62mzXV3WFo0O1m
	OeffSLsDTGN68bvwGCzuBFgCSw0A==
X-Google-Smtp-Source: AGHT+IFYV5TnCzk+c53bzke6nPS2rmsXWIkLBB61jOeJkZU/pepHxMCueeeEqgu0mBt8iULwpOf2mSKf5NdE5ODHOPs=
X-Received: by 2002:a05:6122:4312:b0:520:6773:e5c5 with SMTP id
 71dfb90a1353d-5258926463bmr4862359e0c.7.1742464900176; Thu, 20 Mar 2025
 03:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202503200755.DoMipQnf-lkp@intel.com>
In-Reply-To: <202503200755.DoMipQnf-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Mar 2025 10:01:14 +0000
X-Gm-Features: AQ5f1Jrf1Dd0xKJnFdvTZS6D8krk5Rik-xKFXlxkwAiuooKI5_9kmPU6SYIxyac
Message-ID: <CA+V-a8us=RbApdSJ7SLchrQLSbch8jkP3uOCC8TVFiVe4yULnw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 20, 2025 at 12:29=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindi=
ngs-net-dwmac-Increase-maxItems-for-interrupts-and-interrupt-names/20250319=
-050021
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250318205735.122590-4-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer =
for Renesas GBETH
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/202503=
20/202503200755.DoMipQnf-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250320/202503200755.DoMipQnf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503200755.DoMipQnf-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: error=
: use of undeclared identifier 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP'
>      125 |                            STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>          |                            ^
>    1 error generated.
>
The dependent patch [0] has now merged into net-next, with this we
shouldn't be able to see this build issue.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3D0c1f1eb65425

Cheers,
Prabhakar
