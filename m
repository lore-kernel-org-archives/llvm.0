Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732458;
	b=EAVqMvtGSwm8U63Xd+DrNeYjKOanazQWNGIK61Ab2PvcC0uelN+2XX1F8ysO2BsSa4wu
	 v5qve9UoPEsv3DmNZbdcm/nJgDU4fkr8Pa/NQyYiNPqrHJy+/xKzXMAkRwiDS2i+vkUA9
	 fOjVz+LBP5UDoRDzw7bRN4f8WiVsAPtj615mSgHoHoA2oda0c/Vc/saBmk5GIkRu4hB5z
	 HI7/CTXBqrlGwhlaVgWJ3ldy1iDg+gqrjBo+ZSukGZliZAsjmtVGduscEdrrIbb/dwlND
	 bafBFXBJFte1sUJgwSllo3sZqTSXy6sdncyhZ9ta9m0aRlfUa7uHiDAkFSGm14epuhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732458;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nPbC9p/kXZfK/pAtwP8FvtmaMonTRXTCIHkYzc09zfM=;
	b=h0qbbBPtbMtaQ/o12xATN8sJ28f2alMqqzjkoMgEK2S88f3WJMtUu1ufWMK2cST6viJp
	 EpzMqxn3yb20yL/G71Z3eTqwsoHtn+yoQBH91TOV2XReEZrWiWwzmGI2psateAm2NgnTY
	 MfM3WNK/icQ8y/xT1svOfUE7mYV9hZUEZ/iAPvUZgOgu8CIbsK1FAU9+OppsnD1y11jjN
	 KGBkAGKcY5lPPYuhZdLtyZS7cymQzZK6vrUC0EFPyF1AOF5PloPwiJDfZMY9RZyVsbevt
	 uFYrYyBMptueYJxlNDpSgbtrmFHPAj2K6jsfR0Ev8cmwG2S14gY7hBwUoKdVnPeMHMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mA3KNvu9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B3E606A330;
	Tue,  3 Nov 2026 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mA3KNvu9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1951F00919;
	Tue,  3 Nov 2026 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793732457;
	bh=nPbC9p/kXZfK/pAtwP8FvtmaMonTRXTCIHkYzc09zfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mA3KNvu9dg7XUyhJO0i0shuS6M7OCVvpPJ12H2WiorQDQRwexlDCrSlqzfrLNf6YT
	 UVpjkw08WSqPHQzkqqf8i4mFVXpr3Wg7kM0/yBXGVrT7wVT2l0vZdxtfod18lCAPy2
	 XJ2sCPSkDumY332hjBeQ346+g5Jqk+WpWRGxZx2P88xUjesfQkge49DYFQTc1QZCy9
	 nFdw8SsvHpeeBP2IipbPgbbaGYfdvXGxdyQp3+D3sipL6je0FiYu2qmByUTcEz+7qf
	 OzKxc7zzcEU5C7ndPp/zWJx6b2C2xtpQnC/dCD95fuehMxkayaYVecqWuZ4SwaxZN7
	 s+LCjijx97KgQ==
Date: Tue, 3 Nov 2026 12:00:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rosalie Fang <rosaliefang@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	David Laight <david.laight.linux@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Greg Thelen <gthelen@google.com>, Yi Zhu <chuyee@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in INIT_1()
Message-ID: <20261103190052.GA267580@ax162>
References: <20261103163404.159582-1-rosaliefang@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103163404.159582-1-rosaliefang@google.com>

Hi Rosalie,

On Tue, Nov 03, 2026 at 04:34:04PM +0000, Rosalie Fang wrote:
> When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
> unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
> exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
> constant conversions in unevaluated ternary arms when initializing the
> s8 lookup tables:
> 
>   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
>   (aka 'signed char') changes value from 131 to -125
>   [-Werror,-Wconstant-conversion]
>      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>         |                                              ~~~~~~~~~~^~~~
> 
> Explicitly cast the digit-branch expression to s8 to silence the
> warning.
> 
> Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> Assisted-by: LLM
> Signed-off-by: Rosalie Fang <rosaliefang@google.com>
> ---
>  lib/base64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/base64.c b/lib/base64.c
> index 325c7332b049..1489c048b1fd 100644
> --- a/lib/base64.c
> +++ b/lib/base64.c
> @@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
>  #define INIT_1(v, ch_62, ch_63) \
>  	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
>  		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
> -		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> +		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
>  		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1
>  
>  /*
> -- 
> 2.56.0.385.gac671c819a-goog
> 

Thanks for the change. I avoided this in a different way, which has
recently been merged into a tree that should be merged into mainline
relatively soon:

  https://git.kernel.org/akpm/mm/c/3af83c11cf5990fda0bfe3959aa6391ff903ffdd

For the record, I do hope that

  https://github.com/llvm/llvm-project/pull/226775

eventually gets merged so that these workarounds will be unnecessary but
I am not sure how that will play out yet.

-- 
Cheers,
Nathan
