Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BE13222
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689005529; x=1689610329; i=markus.elfring@web.de;
 bh=t8MPBk7LXk5MEPPJCKliAN1DB2BVxvTnDmNz5Lt6d6Q=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=ERFgDDo+75+Oz7BUuDqfUhemnU8yReiEGUjYsqrwSPzvo3B7Au+K43kKLDu0WwPcU9d7YvT
 s3biAej5jM+oNJ13fNi7r8XhD6tahl1MBj3H+gjoBlFG95gkF6V2QtvP3APasGSiy+itjUkM5
 TxJgNqWwETWm27XmjhK/KT5zgUu+B9llrRJ5gHeM/OKBpkOEeWqPkRasP2n8I0lQTFIzOSZOy
 QTjkpcCfjA5H3QUYRhF3aOuunypmKwCrnTXAt/Q9poDxoGDvzFjq/GP31R/h+iuc0O+zh8XhA
 dERJcZTmh6TqIgpvvDnht8vNOiRyig85/es1W4mIgb+o+yre6Z3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXZf-1qAt1G1Kr5-009QUe; Mon, 10
 Jul 2023 18:12:09 +0200
Message-ID: <a8865b83-bce0-0fef-1f18-744fb063abd0@web.de>
Date: Mon, 10 Jul 2023 18:12:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Linke Li <lilinke99@gmail.com>, linux-mm@kvack.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Linke Li <lilinke99@foxmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
References: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
Subject: Re: [PATCH] hugetlbfs: Fix integer overflow check in
 hugetlbfs_file_mmap()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ksl1SO7jj4HzuXTPfuBIL999XNIhotdwsxOQyAmXR1uPv6i5r2/
 D3PlQvypRhuqjuPiFoGGLZDSmAYU7YwYPOocIBISdJV9pKvAAKEDDX6pmsjpUiZF8yqUQ8W
 TcYFjkCIkJmZdtFDPla7XtDtpqqSrnOhTBK5X3c+IEbyadetiXEFCoyTEoiftPwel2GKy9j
 jSQvXHO+efoHYzH+KFtog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KS09CIOE6hA=;D9m/agfoHR2cwGtQyLT5MQQbm1j
 ruj3I+A7RErwGBVe/pKXZ5FBRvhiSYYR0o35NIWevrZHRSHzGOhPPs5Z2YYXm8P/YpTwFtVBb
 oXUX4sU4z3zp9rtuewJ/VnVcON4Wgff2iIfOhXy7xk8j3DSp+EpcYjvdZwvfAc2SOVWElwjdr
 mWb0/ucCEaLTc0TCEQzaFUzkcwt+TlhCc9EyPMyx94X8JZ40MVoXjf8CvxNuy9nPO02ATwnqS
 yF26SyQQo+b1Bu0M7lNiYfADKzXD6T8BBZvW1XWzd4yUeuD0D92XDTtQoxqIPvZCog+wDJ6Tg
 2mmQfon+jip1+Nolz2PBavUz1rZ1nkFsGSAIRjSriUigyVyzDuoFxPYFpHiyVW+pYwIAfhpJW
 ocsfUqKkLHGu8vZTNZEE8vzTayByO1Rn4WXa1F+esyWLCLKypsXMs0WVipPq9hQmHBAi1SGQ+
 wfjNUk/B0dyqFB/cUI9i5sVSDtGGdKZ2IEsMAdupRz4W0C78zSXiWlo+WRpb1UcLWgP5HwSoB
 rcKqz+O1Gevt6JYIj+elPq3OTzgoeGWrMELTnQlaLIbE34dA6+oN/ZfE1ObX1Vuyv2Cj77jBe
 VIqWl8rewIC5b9omR163adGEQtvAKj2d/8KyHTZ2FmmkWE1u5it/My2JbScAgucQBYZVwarqs
 Taiv4DvL2wk3TWJBRGOPcy53L9GTlhAsYBawhGF567bktitRzZ2rHoPv0vAqy/G+37LO7hR9b
 exEdUjFPi0JLxB30odqqI+bQKFv7QDeMpt+axNU3nxk65ddyShbcux2P6t6zDSdLljYRhvGHs
 2VTqRpTbcpDTjbrTKGHaOhKCJGrqYuosL6zjvMERRZHmNmARkhFbX/miJM0DkQhjtB3zZvqS0
 6KFvfl8BeUdeR4BrKGxdG2XWYd2sqLLmGRHUSA0ASle3BIHsCBMP4VY+0HvgNZZKFPIuZSs3c
 /tFMXMVpGSY0AEQzeJ7S/f6YeFo=

=E2=80=A6
> To address this potential issue, this patch introduces a new check
> that effectively prevents integer overflow. This check ensures the
=E2=80=A6

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.5-rc1#n94

Regards,
Markus
