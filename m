Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3953BB
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 22:43:12 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 39402 invoked from network); 12 Jul 2022 00:16:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1657577790; bh=FgTwvTq1JSrz7mNIp0oVdLzTuHaPTbJ115CWdvj3IsY=;
          h=From:To:Cc:Subject;
          b=dGF+JIvhtiNwRtOLhAFoU3bdxIOTiLFqUQqRJ0hYY9kTH2XXPLelltdRlzWJh77Gw
           g0yfU8HALnN7CZ05qIMYHo+BahPsPC3/dRrjUjAAT1x0JJ2pcphq2zLY4+RcY9fBhA
           xxdN+wh4Ifh0/3RF7rWZd2iR5iq/kpSCYRAAzxiU=
Received: from unknown (HELO kicinski-fedora-PC1C0HJN) (kubakici@wp.pl@[163.114.132.128])
          (envelope-sender <kubakici@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <justinstitt@google.com>; 12 Jul 2022 00:16:29 +0200
Date: Mon, 11 Jul 2022 15:16:11 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Justin Stitt <justinstitt@google.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
Message-ID: <20220711151611.573190f5@kicinski-fedora-PC1C0HJN>
In-Reply-To: <20220711212932.1501592-1-justinstitt@google.com>
References: <20220711212932.1501592-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-WP-MailID: 2595572855169aaa33be638c199b8625
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [wVN0]                               

On Mon, 11 Jul 2022 14:29:32 -0700 Justin Stitt wrote:
> When building with Clang we encounter this warning:
> | drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> | specifies type 'unsigned char' but the argument has type 'int'
> | [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
> 
> The format specifier used is `%hhu` which describes a u8. Both
> `dev->ee->reg.start` and `.num` are u8 as well. However, the expression
> as a whole is promoted to an int as you cannot get smaller-than-int from
> addition. Therefore, to fix the warning, use the promoted-to-type's
> format specifier -- in this case `%d`.

Acked-by: Jakub Kicinski <kubakici@wp.pl>
