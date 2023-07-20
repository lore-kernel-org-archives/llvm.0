Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02396361;
	Thu, 20 Jul 2023 09:31:25 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7EE6D320248A;
	Thu, 20 Jul 2023 05:31:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 20 Jul 2023 05:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689845484; x=1689931884; bh=U2a19+l4K+Up0s8WbTX4X+/S//YeXu8EODH
	4tusn4f4=; b=HTxbmool+FaQXmTzZm3NJt3YSf5csq1JA54eLg8Jc2vq3CLCpZD
	ACdA764K+YcfpUV1rO7by/YHsSCwVxtWCmezwHcBop+ENPxSQaxnhLjRSIE37sCl
	XXljH8o/7rwUxwVjSFvrd9rTxtkk3/YPmaeU4aIzHVV0mKZ2lUPq4OBXbtCXUtjP
	vzWHzqL8xu9QHCrjjlxHJZNW6QLXme1fHlPg6PG07U17zrzCiZLC9C5IUEIvPj+J
	Y/BKv4Xxgqr7mYq3gaM7QtUk3m+hUfN76lj7XzD5xyTEwC069tVX3OW6N+nsmeao
	QZSD+mcUwV3yW8iBGfL/tFyiEW6ixJfIj9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1689845484; x=1689931884; bh=U2a19+l4K+Up0s8WbTX4X+/S//YeXu8EODH
	4tusn4f4=; b=Yp+D4mODVtmSzq7u9Nhsx0JjTo40x2DqnZsPcrkdzH55vQFMvKR
	iCA8RjGqQylXF0MHA9xbPT49m9kbn1wdw1xr+m73VOfDHfVyDNdpIL9nNQ1rFGzC
	VgAlR0FhdZbiH4wz+0WtUuStPUVlPcCxfqlvyeiEzaghtvzOFzgwq2LSBfFtwPIt
	H5SezdfT1haSnusA2pJllOBL/Ufm4/qJIq/vWJnhFE/sENkptjQXsQ2lWa1fg0Ny
	0FS64Dpk2eELy6JlHz7p+B3MPzQMlQDWI65BPLcLN7SwCeTmNg+Vdl3s8kpU4B5f
	kzniY/5nyWMTbv+U7MMyz/YKSeiI9v8fmtA==
X-ME-Sender: <xms:6_64ZAY0yl8W0YYp93hohKTHeRqOs7TJBxa0JTOJ2Y6-KKHrp6mHtA>
    <xme:6_64ZLamU-XQss75OusYHvYt50Fg4yvSivz4XQ1u0svVMIp27qSdcL_aPvibBNTSL
    LXMx07VmWfqzlVDEXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedtgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepuefffeeuleetkeegudetfffgkeeiieetjeeileegtddtieeiuefhuddvudeh
    jeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:6_64ZK_XjUdrMviErKgMKrUJlY3E95QrET5VlvAsVhzg13Ni9uUxRQ>
    <xmx:6_64ZKp7Y8PnibtTn7wZ_C3Qt1v_QowcGtYXk83O90m5lWhJMWwO0g>
    <xmx:6_64ZLoncjtEQQlAYr5Z6v2vVDp3od3CcjhStAGPGuJ67sDXROuz5g>
    <xmx:7P64ZKVUqxq-SvRZhZ4V3RJwkrsegq8IyB-xQraz0bMkQwYvR7HLwg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 66DE9B60089; Thu, 20 Jul 2023 05:31:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <769e6521-a86d-4380-b27c-2ff29b795802@app.fastmail.com>
In-Reply-To: 
 <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
References: <202306211545.7b6CdqsL-lkp@intel.com>
 <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
Date: Thu, 20 Jul 2023 11:29:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "kernel test robot" <lkp@intel.com>
Cc: "Kim Seer Paller" <kimseer.paller@analog.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
Subject: Re: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13: warning:
 result of comparison of constant 18446744073709551615 with expression of type
 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned
 char)0, signed char: (unsigned char)0, unsigned short: (un...
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023, at 10:25, Andy Shevchenko wrote:
> On Wed, Jun 21, 2023 at 10:19=E2=80=AFAM kernel test robot <lkp@intel.=
com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git=
 testing
>> head:   25e201cc6ff270abc062e13ff912292097cb2827
>> commit: d3e93b67f934a477c5851d575a2278f07c6242fb [6/10] iio: adc: max=
14001: New driver
>> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/=
20230621/202306211545.7b6CdqsL-lkp@intel.com/config)
>> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.=
git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>> reproduce: (https://download.01.org/0day-ci/archive/20230621/20230621=
1545.7b6CdqsL-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202306211545.7b6CdqsL=
-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>
> Okay, you even haven't compiled your code :-(
> This should probably use one of the functions from bitfield.h.
> Like u32_encode_bits().

I see the warning is now in linux-next. I see it only shows up with
clang and not gcc, but it would be nice to address it.

>
>> >> drivers/iio/adc/max14001.c:135:13: warning: result of comparison o=
f constant 18446744073709551615 with expression of type 'typeof (_Generi=
c((mask), char: (unsigned char)0, unsigned char: (unsigned char)0, signe=
d char: (unsigned char)0, unsigned short: (unsigned short)0, short: (uns=
igned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsi=
gned long: (unsigned long)0, long: (unsigned long)0, unsigned long long:=
 (unsigned long long)0, long long: (unsigned long long)0, default: (mask=
)))' (aka 'unsigned int') is always false [-Wtautological-constant-out-o=
f-range-compare]
>>            reg_data =3D FIELD_PREP(mask, val);
>>                       ^~~~~~~~~~~~~~~~~~~~~
>>    include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_P=
REP'
>>                    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "=
);    \
>>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/bitfield.h:71:53: note: expanded from macro '__BF_FI=
ELD_CHECK'
>>                    BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) =
>     \
>>                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
^~~~~~~
>>    include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_=
BUG_ON_MSG'
>>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), ms=
g)
>>                                        ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~=
~~
>>    include/linux/compiler_types.h:397:22: note: expanded from macro '=
compiletime_assert'
>>            _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
>>            ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>>    include/linux/compiler_types.h:385:23: note: expanded from macro '=
_compiletime_assert'
>>            __compiletime_assert(condition, msg, prefix, suffix)
>>            ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/compiler_types.h:377:9: note: expanded from macro '_=
_compiletime_assert'
>>                    if (!(condition))                                 =
      \
>>                          ^~~~~~~~~
>>    1 warning generated.

It looks like the problem is the use of FIELD_PREP() with a variable
'val' instead of a constant. I tried marking the function __always_inline
so the compiler can see the actual value ('1') that gets passed in
as a constant, but that did not change anything.


It also looks suspicious that the value first gets read from the=20
register and then replaced with the FIELD_PREP() output, while the
original value gets discarded. Is this intentional?

        ret =3D max14001_read(st, reg_addr, &reg_data);
        if (ret)
                return ret;
        reg_data =3D FIELD_PREP(mask, val);
        ret =3D max14001_write(st, reg_addr, reg_data);


I have managed to shut up the warning by rearranging the code like:

diff --git a/drivers/iio/adc/max14001.c b/drivers/iio/adc/max14001.c
index 18ace09601985..f2ce8f8947982 100644
--- a/drivers/iio/adc/max14001.c
+++ b/drivers/iio/adc/max14001.c
@@ -117,11 +117,9 @@ static int max14001_write_verification_reg(struct m=
ax14001_state *st,
=20
 static int max14001_reg_update(struct max14001_state *st,
                                unsigned int reg_addr,
-                               unsigned int mask,
-                               unsigned int val)
+                               unsigned int reg_data)
 {
        int ret;
-       unsigned int reg_data;
=20
        /* Enable SPI Registers Write */
        ret =3D max14001_write(st, MAX14001_WEN, MAX14001_WRITE_WEN);
@@ -132,8 +130,6 @@ static int max14001_reg_update(struct max14001_state=
 *st,
        if (ret)
                return ret;
=20
-       reg_data =3D FIELD_PREP(mask, val);
-
        ret =3D max14001_write(st, reg_addr, reg_data);
        if (ret)
                return ret;
@@ -299,7 +295,7 @@ static int max14001_probe(struct spi_device *spi)
=20
                /* select external voltage reference source for the ADC =
*/
                ret =3D max14001_reg_update(st, MAX14001_CFG,
-                                         MAX14001_CFG_EXRF, 1);
+                                         FIELD_PREP(MAX14001_CFG_EXRF, =
1));
=20
                if (ret < 0)
                        return ret;

but it looks like there is still a bug in max14001_reg_update(),
so I'd prefer Kim Seer Paller to revisit this issue and submit
a properly tested patch.

       Arnd
