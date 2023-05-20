Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29D652;
	Sat, 20 May 2023 05:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1684559083; i=deller@gmx.de;
	bh=7KKUgWt0aRVOrqshl6auDWoRNkMtVlTSaqoGlnGU3Vs=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=oB/xc9OGSiDnnzdgfFBjBaRCrX7BDj0fWlufgvTVAA/VMsRJmAtCeEZ5BLbq/H384
	 AE58VWTtgEnPvgJsKdAcSeRwqgRLju16/R+GKIOiXmZtivonarjAqAhtAIEtWsqvlS
	 w+0s9wsrpbRd4+hhhtAPBugTDSydq/rwZW8dXZjcX7pWI5o+UCbSjSM1droRY/WxVe
	 fm772MFQSf8X5+4PPnRCwz9Ov3ybleDRg2XCszzD+KO+h7YlNJSfLFSRCaT/oSUSYI
	 3AWrCq4qYO1SuNd1SOHAzsrldT33aJLW1j87ERpe56ZFOGhamGn+BSPK9AaKRNBXFZ
	 gk67npu5G0WrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.147.136]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1q7DvO2NEv-012G6r; Sat, 20
 May 2023 07:04:43 +0200
Message-ID: <37e1b7f8-ba94-b5ca-37d1-4c63f146bb22@gmx.de>
Date: Sat, 20 May 2023 07:04:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [deller-fbdev:for-next 2/5]
 drivers/video/fbdev/core/fbmem.c:1499:23: error: incompatible function
 pointer types initializing 'unsigned long (*)(struct file *, unsigned long,
 unsigned long, unsigned long, unsigned long)' with an expression of type
 'long (struct file *, unsigned long...
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <a48e12ghrolqo6163q6p6on7.1684533009589@email.android.com>
In-Reply-To: <a48e12ghrolqo6163q6p6on7.1684533009589@email.android.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FYH5VMT49ByuADsqAWoQXtu5Yj2V+rjwHMnK2hbAUzf0FNeMLD/
 x+/t3p7/njc6cl9jKOCEUVa536Q09NaTl1mDwP64F+3BHtUNa7+qh9dRcy6KvCtLaWaMmSY
 74zUNrUQm7xODaJoZhSzH5C+Ldf0gvlB8PI0ucJA8qOBTYe5L8pI6iw/n0tCFj0hqE7ziBG
 9cM09sg1dEnUWL5HjnQsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oFRduNkOOdY=;hkhIxeR1FNTvl8UHJFSCBhW/NYe
 MDFVXThHFID6PAL/aTgRPaAH86l5h3ig0d4Fuj0h67HL+kdGLTIv7fVBYQi9WgRlSjiCyf/e0
 dLrO7P9l2zhg8PMC4r7rjnwkjF28o6q0vJUKfLg5qkgJILvXapfzqcOzXNeV6z42vURzxRx/J
 MOb5C7kt3xxqKlueUmy42v50POVLnVSLwFxYFP0x3L9X8alsvnOrZAqQTphKQL5jMUI2MrC/9
 b3T2gaXSRgbEd2y47vwKCjZgFuy2+Iv6PFDjhAyNz93WuVAapV17j/TZec+mvOSQeSaEnXvgk
 HQxBbjFMik0JW5BXvWUiIZchyAurNB8fve9p3alp3l2YARkfTxHBV0Wnz9AxmPW8kwFkIddSb
 Eaz2AKfwaPTSpylbTOzGvig4jYe3Bs+CQtT+HsWv1zsHtonAcYzjWHRexqDxG7GJkE1k4Dfoh
 5GZ6vPQ23x3QsZmfuSzVYxTC5/8UhkDIDM5WOY31bMocjZ/rZcFpsF58AnvY2DHI0ZRqRgkAB
 xJ+x5j/zBAWr3LyHwyOJEzmRE6s1T+pWnCZ6ZwIa9girN65C5tp6HNo7wTT+d2PhsgvFrSjNI
 M3ygYL9Bi4WioQ6vrGSlLb00X79ld71c2dtQQm+/6MompaAAaS6ZJzNETILJw/n7gPY8Yp1os
 1L6ecOhowtxcqttlt9EZOUxSz/MqVfVzZ3XwOpOkD9PORIrlgLonnJZY1cjeGg+S8LmShdf2X
 1L3SGbirYbMO5mjfe8LAJq+qvXZUFFGBqA9fihYS71EX2fWOx+i6Uq1/j5q/SUJUUI028Z7Df
 lEVAfccXVtyG6mE1nxr90YbqO3RfkBLaP3SOF54uq9BBAj8xkl6TAkaSY8/9I+KlI2h6WtQ9A
 LoqOLoje81/Ax8ezb3l2v8hPpKd40XrSVXmCVtTuDzo0HiaW4+mdhKaEpgekAZQ7kc3jl6w54
 OM/d0Q==

>  >> drivers/video/fbdev/core/fbmem.c:1499:23: error: incompatible functi=
on pointer types initializing 'unsigned long (*)(struct file *, unsigned l=
ong, unsigned long, unsigned long, unsigned long)' with an expression of t=
ype 'long (struct file *, unsigned long, unsigned long, unsigned long, uns=
igned long)' [-Wincompatible-function-pointer-types]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .get_unmap=
ped_area =3D get_fb_unmapped_area,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~

fixed now it git.
Arnd's patch was correct and was broken by me.

Helge

