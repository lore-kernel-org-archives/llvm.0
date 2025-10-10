Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2723222587;
	Fri, 10 Oct 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091741; cv=none; b=uXOrFOGYsPCWvfMR4F0Gep2ROZIR9BnNF1ga5pbmuaUiry08zIqAFIo9Ohz+DJZBgJL1GGSIwOm1ugs8gyAkqEk2GwCpGq8l2PngTnFoDL0lDT64oYmWYtXJLba0z8XhDWCBEMrH7xWjH3fUsSKQqZpxaDkkfF4i5ySFT47KaqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091741; c=relaxed/simple;
	bh=FrLhaPsLzubi37yzBJl2DYS1K5cr6ECub9fTk5JTBqE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rWXEjsFqjlkYNb9OgT+mEjskVg9wjF0xDXUALldX5QeV21g0eEECfYVDK1URwxl5Y5f/IQXB7WQMj2OVd4Vb/Qf/AJVNl990Mkev0vQH4K+TZk+FNIQScp0o7XNRmtpCduG+1vfPv1n0ZBguPxbrhuKYqeicrVqSW4LNpR8yvm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ohG2iXdV; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ohG2iXdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760091733; x=1760696533; i=markus.elfring@web.de;
	bh=3mrkFhmX9z+2w+BR1ZDZcTlIWVicgMCwi03CX6H14l4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ohG2iXdVa/iJ7pfcIvFrOmXYDW3fDfxzeVspOpildIsLhSqaMu8iWB1e1S+HUkhP
	 nzAY0lto1WcNt+Smb9CcGS46jHZWl/HZT05wINtGSTO+MbT8vCt7MdHJnNGxw9x9e
	 2a2H2J8f5S2GDjX3T8dAh099NrC0C4Wko7IEsOqE0HiV0E+y0MjeDhqL4AHV8upw0
	 L9PkH1H+hKb/IroAPTIbHxRUxjSR6RwVDBhmq2Da2aZfWzQS53aGgS3UiQQcgwW6d
	 UnxE8pmE/7jbHUkXub8TQzVIgt8ya+b/X2zArDmPTc3QvezsWB814xU9wEc8qj0Yt
	 Zn1mZBQ8O797EXhCKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Madzi-1uWAYR37Qw-00cSJH; Fri, 10
 Oct 2025 12:22:13 +0200
Message-ID: <b42cffc0-8996-42be-95a4-be4f8556aa3b@web.de>
Date: Fri, 10 Oct 2025 12:22:12 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lkp@intel.com, Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202510092253.kjfjscfD-lkp@intel.com>
Subject: Re: [linux-next:master 13403/13588] fs/smb/client/smb2ops.c:3128:3:
 warning: variable 'rc' is uninitialized when used here
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <202510092253.kjfjscfD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mLF5L75Mehi65jTukJ7JuiOXHmLIKDEb7yjgft96fYHj/7lXyMK
 j6D5a1rvvVisZs8gcwddb7Dp6lmRj36PbjPjbCXq+FVtqZmWPGf0aVSUtY/9altdTAffJ6d
 KZOmZO47LeJTJCHpOBeqx50xtUEG/18TKsMbLWE2FFJ5i2Z+ahCvQyTNJk3Q3uBvH8MxVcI
 6ly3omf49qpul6m0MryIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yKMImwjG0ac=;bOsXvHvoxbp3y1f3rt4a3yPqwuj
 kjNT6ZHVezfqcO++y6JtY8fCRz1bQTMQP1OYDXRa857iMdZkXMsN73b+aKnzcTUEaGmwhHCHG
 7soO81A0BEKS7qfIQaaKDUMIwE7Xy7DEVVWVD+9I9+IIRWvlXnkhvhSgOXFAqX+U/hHl9yUK+
 4eEdplLv9P6cl8zVDDSzuQDZFEAmwawWcfb+2h3kGR+sSSO/txGsov20SUvGEsbiAtXO0SvJl
 98JLYLU0835Ij12yuSg+k59J9gtHSRrXDJFW3ZxaQ4ArgwOp5t0VSDKwpzIo7lEhq3AJ7gBVm
 KaZdat7vEV++/biqAb2DKaeMuq+NQJgyFLqunJdWyzXmVxEPZy959arCy5oc0eZE2eZxkQQNd
 C+Exa8yK3qsxzwkA1cp5Aj3XGOonsNJfH424ZitgF+tWan9VOoyJiyHagNJGGFxZXvX35Vl8k
 Q0TyGIZXhLtvG1/Pr8lzJfWdN2VepcIo6B0P8m2TdFFvqpQHoKyUfXcSs4+cdFp2KJMwmBegF
 sTI9ZgHOFjS2I0fqZfZL3N+fIFtl7zTJQvaBR9kIb3JA6khPYbFEgwFxv8A1tmh9WXYXEH/I/
 FQ8XPr+9wdGmUFilPjtXuswu/1jPp2NAJKoxszTcarLTN8tekBZvUNDdK9VCe5cBWrVGgH+P1
 nATAQj+wcFblR+qbXcwKd+pLXpKwd+Vm4UkPl7tV1bmGFRYR6PevziGDuLvtXfStS6lsdy2LY
 9ZHKORLcwuGMc8YZkSCNmmdhjAVcwxySzjG7dQJn3O6atsTP6fSdkdp2itSxhQ37/JnpHTWO7
 mCQFu5ZMflQqyxc8nlQ1zN9fqNe0OTnbqWEKKS2Fy0OeSLTsEMUfGAdFWMgFRIZ3T2CqKeB7e
 9p7FOcwwybBOzNlelUMhFX6OZNeEubusZC1zNxrHmfjWyUkMOV1qMs8AQPr2XTwm68zafp5pW
 YLyCoWMbW1y/Q4SiT4xi90Cfi+Zqphow5lRKnZl26FczjBZtjKo/nHOCtV0CmOea29MrDsXs8
 PY/2wjA5Y2iGF4u/EGegmMihSrWgkgrkIeP0asCJQiRp1blBwA2jNwr94dKGNHbv/ZU4L+6UP
 mT3jlrNe+ixBm3gknhCSektAERh65jguZdyFoJScSLL1Yslvy1Y1iPN9YfpDSelr+1W8iVj4Q
 EXOmfWyttmZ07eNlZe4ScBkqHI5I4SOIEaHeNLt3fcqZ3UiKIAqnTu0T9NdxQ+f9GYanivx/g
 hWbBgL2d141okrxwBGE3N77L3DUCIwB14qjUncMSaSmCYbrMYNMGAGxAgVq+akJ5Oq5KIoCHQ
 Luhval62XdAUW8VinjZEv0qf6doQZI15dWN+ev2egCsHn/VrEuurQNRtstxAlL90ChGCsfQVV
 O1FN57ByQCC24OPbNQkuk85qUrQ9B8N1kBbtsckcAuS/2gddM2tcEArASGrkQAjDGlryRgOFy
 VYAeiid5eOmTytybVjSq+UAPfcwt9N7SUvYqbu8ohTyRS1iQAr2axsYhG4nXg3aqrz2E717c/
 jc7GarrTZBx+cUZdxXEyn54scTSAwTwODjmR8CDN4PrvOjm/AzPBeYfx0l5AxpZV/QbEemCg0
 L7JgfKIKryJ2fyFvlP1Q0hKVD4pEOCByiU+sv45gN5IfnyCLQ1ARt8QDSxveKK5sEYyhvHKEf
 uJYlJUyPydkSfnYceGcDxmrtOcZhSW/8TsynmQT/4GiFo77yKVfl+Xv4EZ58vNIUhjTND4k62
 wSz0z4Nl5EQIpj2og2gWxyOpDDJyLrfaGaIEh8nscEAYD41pyOVgERV1rBxEUEn217uY0r5vh
 VADSCQQw+tTZ/s8FfQ7JfNBNScw7jcQ0O1zv6OT69yEeG7zm1ct5FhPGVrl/uAcZ/DWvYVvEK
 RVU2BA07peX0CLzORo+s0OMsLe7q90LBKQ5UpzTsY5do6Yl99arJie5bnFQbEoLvnQE5P5F/A
 9bfKafzIz+ZY70C4hmluxsGlrcDyJaICL19+u5800MEA3t95Gi9pFhC7sXvsqMbZ3aThPnbES
 EVUSMAZwKfSZH7S8qo3TaqwSz43eKHgm6WFHYfnUXJzbrqoz1n4XKp22IKFb3CkADoM8biu/3
 2xeJQZdVNsav6xxyI+ND9Qzl3LITkP7e9MQciIRIIMxIL/rqsNqycy6HomsXF9ANx6z5rHSnl
 SR1cG1922gaOS2xP0/n54btdx8PjPQkFizjCwTWu/zZap/Cqke4rIPpAhgmRtYJHvoU4bKlru
 /kNNse8mgmDf7aUKuUkbz+GnNCuEv7inPcpvl203QRD0drg4lsxNxf4LZ863D0wSHtknKcLTI
 B1UnpVR/T5X89n5RWnw2oWG7YnhF9++JsQ7u33due12rDXtv318vpn83FxYic525Na3suwIj5
 MPqieMqfOD5PcvnkGwKGmxPtLZz5qZkHoVO6yEHylcQ5tGUiS7tbK2Fa4d4iSFpl2t4jpFkWg
 bW05affHmRy6QaZJgDRpzaouPaQQ+Zxp0xquk5NthJUd80uRJnJ9OHUnuXdZKUwIy13iiHPQu
 kpQ9sXz1axYMiqnSHS3qbWO9GQaoE1wF5dEbq/WebOhciOuYqgAoFGYU7UkC1/dbPZQ9ojH+H
 dqihkkgTGFdd/8tEJTupVQEgFVBcLiKwi4PAgOHaSWAeLDblMubyJdyY4btAz3gFK31+qEPKt
 sA6t+uHvs2pDQc57lHEM3OFwIBNoO6WTuhOFrYwGoRdR3/HxADJYiSXj8dCpwTKS9SZ9gxFdx
 dHSvIpanjn+rj+APpRcTfZZQuiT9caozRi6u5tALsee3m01b1Fuqm8u9IMZQGv7wKWOLGTSME
 FShV6tJqGyB8kRUTqALQk9LECC5wDBrQJzs4YbphWaywRoCtCT9kwfov4UEjlENOZD2xlAdcm
 vu182u43hhq/QoPjc0s2XgdGrHopd2deUZBJX700qORfGsNaCh+TA4qbH1TmVx2OWW/i4OCO2
 tQ1i+pAb0LfBnwexENKRCK2YRIliT3Hv4EjGyDQG2j0kgpYCdq3kd9U6nR4ecqqZJL1Lj3vGy
 YuXKW021UThCCIpnRSad7rOtnrWYoUX4l/j1Zjxgeiv+MohUfsryCLUnDSGZMjO1rR+g6EVY7
 ehH5VqSag0AAwGgw0YPT/WODjbsJBjbtW0Dc445dg4+AUvcXOVDyeJBMwLFJiEgx6Dbvui89B
 jlqGyX06ixpMAYWg/BxF9tCNZ37YWQ8Ku9sG903gKLtTOLgfY68TodqAEGyHc1eklzi5TByQh
 OUK0WzCde5urtlwxfz0ZV16TwHt64A3XCOMUrwGlVc6/hAnTMnxqZEfWnzS33SJH5Dvu6j6rL
 h2A1dRSV7XGqM7KCm2sntTgH2chqHWYyZu0/qjnSyHxyiJ2QII1XHNspFfbjrDel41EKpLxc9
 tA9AfsdoevECDfA0KACDFGCiiN5k5zZ/NLskMHARPlfXvUXKDG2KPVFuqwQNnwY0QOnJ9s1pB
 JNyLoxLuA1TBIT2Ff1votow0LQVZJE/t/D2p46VDnAygsx3q8Rn3mPDw6OwuVcrHXPByfQOqA
 fOI8HZFJSuSJMCvv0tcayxGEK7+AMkLnwBnEl8reTmnuSguSn7S9DcfySeCBhjx/ZF+rif8+P
 ZmD2VgY5BGefvR4cR6hQCDEvpKXHvP+x5Gk8CmifYSqsEO4XUkt4bt8jsLdfV3w3y6YK/lMOT
 /cEqdq2z1tARhp5IcDNMICfE4TZkekWxjc59Fc/fxkYvmPLoekVgjdT9LoBEvEEi6SFpY+tGp
 y0SEvDUH/Xoe5XXqQ18QuIplDP34z+7MUit03FnvT19OLVLD9L7v80ax7aoyNfezfBeAt7OLP
 5odn6iDSKRKRXLzQqGzjJhCWLldauwC0lFtn36H9vFXp35g0C8A4WQeXhzAZmgbCAJZskw4CM
 23A7fBBSqE6xpEhru/thvsmlAOLFzzxG3/AN3/EnyVykNOC4rQ8L/orHp8DojXCXKo8EuHJ6e
 wk/kNcJM3PN7ifycJps56SE3dVyNhkT8nA4OeExqz+J7gUUxkB3Df/4dcG106wgMyGiJATKbA
 YNwrRwMrSFQXsEbqmbaOiBgZSS5Gbi1DaqZi0XpOYdpZPNaORXGCaWrHstvQbPHiluFmW/efb
 Jt0xwegQAY0V5IUqQG50DrOv75RONqAmSxZ5wfZj+2nmQjniPhHQ/FoyTNk7kcycjNLXVoKIH
 89Zig/eRy7xIiNXJhT0AxwM0dAttSM9wQS4HKh4RS7+td5hzlsyudwAzPJGhltCllv7BbvSbd
 YDYHOpnp4kIWM3OeoGxTuY6CtfjlGEkQC6IxQhHNlxJjkrI9sp2dH98crcCt1ZCmGP5wmCpYl
 7osZ22jeLzBy7eYQYNsWQ4eBnxWxJCOqSMFoBO7mS/LRdFPGzvomWmBX1d12+34NP1vcAq/DQ
 rckCpGfH5Z5/iyRkTlFS1XYDqTZPKFzHWPdsuYwBLdkxUypBK6sC9FOZfK8mW1DjDI7ZErgaK
 5Hh0AFge/XYzSuutCvBGQUQYQ4hM5+8I5oh7lDPFBNuKr2N0WHyXkk40ci7rT731YTeHg0qYi
 ujGCMBR56AeKWRYaOzrudyVtjnPhN394h3+Flb1xJDQZqDfAkOa4EJSpAbH3yKIuwh7y6E6mb
 r3A2h4ypsEWxrW3xl1jiCUeO1L2iix/cLvJ7jpnY4uvVTCn2i03kMi18p2P8cRscgdh7DAo21
 pX5Z2cayJPr6VNUA/nitKucvm8JQTXqzwvSr8Y/7w8geHaniRzc6fY2qwZXj1KN5XwTWb1KtN
 MJlBAoP5lKwZ9y29byLior6+EwVPp/Ihq5XZkGjHsmJ9tq3YqSrbIoAacZ/juqYj67ZmXU4Fw
 s8HThSlmB4MwWWwgxmhtmksb/zi6ixg7KR3JyZ5jsfHuLPohbRAKVvFk4GPRHWq0FT6IL/cX3
 YDG/yBlzUqbE8A7SGEtBg6oqtblKhygSnNUqbB62aoQD8qhDfhMzviWkUpKm6dEV5E17I5YdL
 txt9rUKGyOZkQFg4pofo0eE9kvW0kAbT92G7jNS6NgEtg7q+J23UVC2oWJqlFmNrwzQUly3JX
 lFMJ7wDXJd2u9py+hkauXKN/w9VXN1Dc/t0k4v9CN7rS2v2kkkdTxo3pamZ+BnINuuKyA==

> >> fs/smb/client/smb2ops.c:3128:3: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
>                    free_xid(xid);
>                    ^~~~~~~~~~~~~
>    fs/smb/client/cifsproto.h:54:6: note: expanded from macro 'free_xid'

I am curious if this implementation detail will evolve further
also according to the involved handling of return values.
https://elixir.bootlin.com/linux/v6.17.1/source/fs/smb/client/cifsproto.h#L49-L58

See also:
https://lore.kernel.org/linux-cifs/CAH2r5mvg=kqPyA2nYF=Nhjr3vkt4dT1R4p-Bk_MBQtddjx_EhA@mail.gmail.com/
https://lkml.org/lkml/2025/10/9/974

Regards,
Markus
