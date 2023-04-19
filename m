Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA06233EC
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDA3C433EF;
	Wed, 19 Apr 2023 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681940131;
	bh=uDOWu32WLIsX5H7rgwRaUvcKnBagn/i0RmAsssPYy5w=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=UXroDrPsz9cmTM9OpkBtYw4t+w9i7UgbIcoDODAen4CK28U61vOPy7oyKPubnSEzn
	 bEopcyjBOkUh0y0I8An46P5y89OG79rGC7YRkUAoQOdtVpt2htgPj5Sm4aBR1euM9J
	 q18ulpnbAa/JZPLiwc+LDeKCe0/XuCw9MZtnGfbiUYgVZpH+R/kpmAhmPRe2xN1HEN
	 lcavW/pWnwy4gzDzZjs9IJAS4DOmhdAM7VsmzNC2sm0SuNAT1JwHNAht4Jm7uHVsJW
	 cLwDhnsD2RHym/3BHKQWZO38cGWdxG5KAAb/A3SnHOlKRm9ZJ7T6ylJpsdAHkgdLiC
	 7/MY/YZy/3fUg==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id E3C0327C0054;
	Wed, 19 Apr 2023 17:35:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 19 Apr 2023 17:35:29 -0400
X-ME-Sender: <xms:oV5AZNzGaN_xpbGHgE-j1GI86rJHpbvyv6u03AOyxmDG0k7ajETFsQ>
    <xme:oV5AZENotgMdKP95yHdvZypLpk6hyaUGebR97Xcdq6zyGmrc4EB1vtL6QEBV2w2ve
    wwy_e_eaX390sR_H-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedttddgudeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecugg
    ftrfgrthhtvghrnhepvddttdffjeefgeeggfelfefggefhheeffefftefggfelgeduveev
    tefhfeejveeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedu
    jedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnug
    gsrdguvg
X-ME-Proxy: <xmx:oV5AZM8BPSpCH3YY0qVcPPTkdjBK22mWMqxH4iDZwnaCCkMHehWshg>
    <xmx:oV5AZEpA42CHRqzboBh9d6-AfPSIcXjzFhfrgRXAr24ZpdgpvRkAUA>
    <xmx:oV5AZO7Q4X1g4vMv5DXsVftT0Cn5e5H0XEw_vuOXZeLyB632d4IyOg>
    <xmx:oV5AZDw2sKP3CusBAfg577jRyilCGnnywR25_fLbE9FTNsIinAv_Ag>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 57619B60086; Wed, 19 Apr 2023 17:35:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com>
In-Reply-To: 
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
References: 
 <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
Date: Wed, 19 Apr 2023 23:35:09 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Simon Horman" <horms@kernel.org>
Cc: "Stefan Wahren" <stefan.wahren@i2se.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Tom Rix" <trix@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev,
 "Florian Fainelli" <f.fainelli@gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023, at 23:21, Nick Desaulniers wrote:
> On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.org=
> wrote:

> Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
> meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
> Perhaps try that?
>
>>
>> I'm a bit surprised as I didn't observe such a thing.
>> But I also don't dispute it - clearly my testing was inadequate.
>>
>> I'll try and dig a bit deeper into this one.
>> Perhaps starting with the report from the kernel test robot [3]

I have this in my randconfig build tree, but it looks like I never
sent it out.

----
From bb01f96d7dd66fc437302785f623a3ab323d486e Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Mar 2023 11:33:52 +0100
Subject: [PATCH] staging: vchiq_arm: mark vchiq_platform_init() static

This function has no callers from other files, and the declaration
was removed a while ago, causing a W=3D1 warning:

drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: err=
or: no previous prototype for 'vchiq_platform_init'

Marking it static solves this problem but introduces a new warning
since gcc determines that 'g_fragments_base' is never initialized
in some kernel configurations:

In file included from include/linux/string.h:254,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from include/linux/mm_types_task.h:14,
                 from include/linux/mm_types.h:5,
                 from include/linux/buildid.h:5,
                 from include/linux/module.h:14,
                 from drivers/staging/vc04_services/interface/vchiq_arm/=
vchiq_arm.c:8:
In function 'memcpy_to_page',
    inlined from 'free_pagelist' at drivers/staging/vc04_services/interf=
ace/vchiq_arm/vchiq_arm.c:433:4:
include/linux/fortify-string.h:57:33: error: argument 2 null where non-n=
ull expected [-Werror=3Dnonnull]
include/linux/highmem.h:427:9: note: in expansion of macro 'memcpy'
  427 |         memcpy(to + offset, from, len);
      |         ^~~~~~

Add a NULL pointer check for this in addition to the static annotation
to avoid both.

Fixes: 89cc4218f640 ("staging: vchiq_arm: drop unnecessary declarations")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 90a3958d1f29..aa2313f3bcab 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -415,7 +415,7 @@ free_pagelist(struct vchiq_instance *instance, struc=
t vchiq_pagelist_info *pagel
 	pagelistinfo->scatterlist_mapped =3D 0;
=20
 	/* Deal with any partial cache lines (fragments) */
-	if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS) {
+	if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS && g_fragments_ba=
se) {
 		char *fragments =3D g_fragments_base +
 			(pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
 			g_fragments_size;
@@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struc=
t vchiq_pagelist_info *pagel
 	cleanup_pagelistinfo(instance, pagelistinfo);
 }
=20
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_stat=
e *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vch=
iq_state *state)
 {
 	struct device *dev =3D &pdev->dev;
 	struct vchiq_drvdata *drvdata =3D platform_get_drvdata(pdev);
