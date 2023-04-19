Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F98179;
	Wed, 19 Apr 2023 06:38:17 +0000 (UTC)
Received: from [192.168.1.141] ([37.4.248.58]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MXotA-1pqEIt37lM-00Y8LA; Wed, 19 Apr 2023 08:37:59 +0200
Message-ID: <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com>
Date: Wed, 19 Apr 2023 08:37:58 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:aULetjx1uUCX4/uGzAK8zgudGfAEHggnkbNIEx5IYKm5oYgcoQl
 y2IRQKcH/8EdzWf7s8uQ3mNa/wXKPYcmhMYXnU6lWx8AbulE7JZ8aEKOsDcsZJJ6T5lRCts
 4hwDDhpaRqAI46pLvvJxS7gpG/bhOip1jxMt3A2n5tEcGuzBj2gdIOeOuaaosSTFF8mL1yJ
 pCtYiucqphUCBsH9E7Lmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AqZbcID3ac8=;DpL3NLLxJnkylJWka6dnzqouL1V
 2P6GHe4/QH7w9hbN31wS9agVUv5rdFeIECogU7sKiZkS3aYZFrHU8jWZF2sk/6sSi+VJzWIQI
 Sqny7MW6fxpv8aRYb4XBeAERxjbkPqS8bcTKBQ5i5mZKzTh9guGmPRWDBeWh18OwFrjWLHRhK
 4U8RgFwaO5O4WaPjXCM9T4KSJxu/Epb4IRXyMSzfnSqsQD1750DYOEkObVDLg7uSmXlhd2aqt
 TmMc9JKMwRx0BtKel9ZtavtqkWnQLv8qzPcUf4EoNBznPkgx/rwJKDDBfLLVjjGVwkS+hJmqU
 75W5BVAxVnkT2RH99lbMgQKujcCkd7YGLIyos01pSaJ8hYdNNhGL30sibGiSFTWJ8gLiSg0a+
 nQAXPipUPMGWo3MPWGA3Tw59EJCfnwj6x3EZKtrTBsCS5aeGjruYl9ImOO7lmqhJJ1Jo1thX6
 O3xRVa07SJ6FHiBqRetT/qhdhvtFbO8bWrLWQRKtlPE1UT1RG5+B9g08LkFBSX1eIaoepsPtc
 k65iJ5H7oR+YMDbqcD6J1Xr6gUFzuBxOXektkQCS1ouFNrAlm0Iu+I3RpgrXoPkhdNhmNXi5A
 xJIMYjc37r93JYm93ekI5b8EJ9F7snOHYTfkTa6R16T6xfyR6nYLVVMxekf+ebsjKSgAUhSJH
 sEj3T9A2FeM18Gkdqv/ohZWziNw+dIRKq4XHfIqbEA==

Hi Simon,

Am 18.04.23 um 13:23 schrieb Simon Horman:
> vchiq_platform_init() is only used in this file so it can be static.
> 
> clang-16 with W=1 reports:
> 
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: error: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmissing-prototypes]
>   int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>       ^
>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

this is not the first attempt to fix this [1]. But maybe this has been 
fixed in the meantime.

[1] - 
https://lore.kernel.org/linux-staging/20221022043548.1671644-1-scottjcrouch@gmail.com/#t
