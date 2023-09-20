Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1623F328C2
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48616C433C8;
	Wed, 20 Sep 2023 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217355;
	bh=4VZ2d49H7sr9rWHygFCjye19MowJnLLFSJFfbWTj9ys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vyv2x2GYTtyai6iEOn85f2Wrj3TEznKggifWFV/zogAhZaNgBRhySwvoYpq83BjEM
	 08QgEV9tO1VdSbGPCqNqCSwoXiPpNZYIdOQXVG2mQeEKdpyHVSYWt4PNU0ihPNpWj9
	 MP+n/TOb9dAJd2eFSYcwZRNxJ03byJV+swXPpKRnGmKm0cHb1UUz3oYhFI0TDG6Yyi
	 ESzXRyHt86kWp1WgFTC8QujZKdq5TuKh4m1tpCnJNNvoeY3Qkfh28xriZWyYp/rAnt
	 WDUqCmu9nCsASquz5OFMiHopKGb88AUt6NfcYabjQjY/rP/7bDOk91INmDokrp138u
	 tSCxUtJec4kDg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Anjelique Melendez <quic_amelende@quicinc.com>, linux-leds@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
 Lu Hongfei <luhongfei@vivo.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915201059.never.086-kees@kernel.org>
References: <20230915201059.never.086-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: qcom-lpg: Annotate struct lpg_led with
 __counted_by
Message-Id: <169521735205.3443473.3273251476364082094.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:42:32 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:11:00 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct lpg_led.
> 
> [...]

Applied, thanks!

[1/1] leds: qcom-lpg: Annotate struct lpg_led with __counted_by
      commit: 3a2a14ad346d60da60aef0a2afc1fb256a56c83c

--
Lee Jones [李琼斯]

