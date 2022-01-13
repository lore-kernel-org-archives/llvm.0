Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6B2C82
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 01:36:15 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 28E20C16EC
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 01:07:21 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 486C1200002;
	Thu, 13 Jan 2022 01:07:12 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: bbrezillon@kernel.org,
	trix@redhat.com,
	ndesaulniers@google.com,
	vitor.soares@synopsys.com,
	nathan@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] i3c: master: dw: check return of dw_i3c_master_get_free_pos()
Date: Thu, 13 Jan 2022 02:07:11 +0100
Message-Id: <164203602351.2985932.12500501407570919307.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108150948.3988790-1-trix@redhat.com>
References: <20220108150948.3988790-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 8 Jan 2022 07:09:48 -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> dw-i3c-master.c:799:9: warning: The result of the left shift is
>   undefined because the left operand is negative
>                       COMMAND_PORT_DEV_INDEX(pos) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw: check return of dw_i3c_master_get_free_pos()
      commit: 13462ba1815db5a96891293a9cfaa2451f7bd623

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
