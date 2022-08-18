Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D73D88
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 11:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEA9C43140
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660823820;
	bh=bJo0tbnIc+uswTk43OUBgIat/qOTrgP5knO6gmn3Bmc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=go5HpSiEnb9Silfkia44lBj3KV8z3dJE8lEfxSn5sJPOSR0QdUW/En0yF+R+nxfzt
	 xmonlgM5DxQO1OFaO2pSFEEZcF6BwxtR9e4jT3Bj+gOltY1fCfU9VuncNOwueGEEzH
	 CiO4UKvsFyYAkW+qfr5OijhVOPMTi97BGCJlND2dFJksnmhANyajez99f+yHC20siX
	 +auEC7lStZu03a7jy8o6/F2YQe+mBo0mLMBpxKkvvBvq8kym6OHh/4mEUnUX/2Dmw7
	 IVcIcJqzujxNq7XdYpHe9QADo880u9JifaKd7+2cGg7Hg+fU+8j54BbAhkGqtBN22N
	 UBL0epRdsThXA==
Received: by mail-ed1-f53.google.com with SMTP id x21so1583900edd.3
        for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 04:56:59 -0700 (PDT)
X-Gm-Message-State: ACgBeo38Dy25rXBP2h5blafiAL3A5BlVx1oGfaw6h01MBBp8rqP5F7pW
	q4YZMawez2AqQ53x2fuUnrVaI9vX88yyCnxrJyE=
X-Google-Smtp-Source: AA6agR6AO8wc32jrPP5FVrfyEjUtRFP0mRTGqvME4Xvs3TOlgChDy7zm29iMH2ed0Jgru/VFydihw0NQ86oOPPucLE8=
X-Received: by 2002:a05:6402:100c:b0:43d:9009:c705 with SMTP id
 c12-20020a056402100c00b0043d9009c705mr1969311edu.49.1660823818224; Thu, 18
 Aug 2022 04:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yv4lFKIoek8Fhv44@debian> <CAK8P3a2_YDCS0Ate7b_nBibsbinjNqvMj9h5foA83NJjq8nE0g@mail.gmail.com>
In-Reply-To: <CAK8P3a2_YDCS0Ate7b_nBibsbinjNqvMj9h5foA83NJjq8nE0g@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 18 Aug 2022 13:56:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2STwH+QZPSB-3aJzap8_bu43EUd9GmeY7pLN8Lfh7b0g@mail.gmail.com>
Message-ID: <CAK8P3a2STwH+QZPSB-3aJzap8_bu43EUd9GmeY7pLN8Lfh7b0g@mail.gmail.com>
Subject: Re: build failure of next-20220818 due to 341dd1f7de4c ("wifi: rtw88:
 add the update channel flow to support setting by parameters")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Chih-Kang Chang <gary.chang@realtek.com>, Ping-Ke Shih <pkshih@realtek.com>, 
	Kalle Valo <kvalo@kernel.org>, Yan-Hsuan Chuang <tony0620emma@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Hi Sudeep,
>

Sorry Sudip for misspelling your name...

       Arnd
