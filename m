Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C83B784
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 14:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDACC433C7;
	Tue, 19 Sep 2023 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695135339;
	bh=PHhE/Lt3Hz7iR4g9GdYD+OxDJ309R2RTFntqEuHpPoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I7yain0l/vUioWrBwIjH0N5q+w1z2y2RW62AuBQd8J6SrQlVw+2vrhpAEEmKB36hu
	 Oro0oXkl+Ahnuz1F8DmXUUMqQjnX2S81eS6WD5VXNsbRhcMia3ViwjX9fN6FRL6Wsf
	 s791Y+AuMLLJSsQL3siONHetA7uz/qF4o0HmgWaEsxOtUw0Kh8I5FqK0enDagk+3R3
	 l+z7SHRpkyxgrw6OLRH4uIRhJdeQDSf3QLFlzImNBnEkG8RxahUxt41b8PNN96S3mR
	 QTbGR7j2aD6YU+6UaroIWuuSeV4amQW8d4dusBc0Oi+7yQcRzTKoviHi0cytli1CaV
	 B1p+32db/zhaw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20230816-void-drivers-leds-leds-pca955x-v1-1-2967e4c1bdcc@google.com>
References: <20230816-void-drivers-leds-leds-pca955x-v1-1-2967e4c1bdcc@google.com>
Subject: Re: (subset) [PATCH] leds: pca955x: fix
 -Wvoid-pointer-to-enum-cast warning
Message-Id: <169513533778.3252260.12959111862312719443.b4-ty@kernel.org>
Date: Tue, 19 Sep 2023 15:55:37 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Wed, 16 Aug 2023 19:37:52 +0000, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |      drivers/leds/leds-pca955x.c:487:15: warning: cast to smaller integer
> |      type 'enum pca955x_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |        487 |                 chip_type = (enum pca955x_type)md;
> 
> This is due to the fact that `md` is a void* while `enum pca995x_type` has the
> size of an int.
> 
> [...]

Applied, thanks!

[1/1] leds: pca955x: fix -Wvoid-pointer-to-enum-cast warning
      commit: 0e2e05099162c089a9b4dac563ae71b4c01a5f8b

--
Lee Jones [李琼斯]

