Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FE7B
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 19:01:33 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id l11so33677837ybu.13
        for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=58fU8wz/MRnYVvG9hVkJSefKiSbVO5jpOlOekUHdxyg=;
        b=h7nZiQLWtuuGLQegQZonr3M3nE9fcED2laPjzMO5ZELylj09nTCLfzfRjGYHCOt7dx
         qbn2/HRiFKBqFhcoTNaM0C1B6wpD13nMZuP0sFbi5cVYDnHI0igdex6RCFQVCa7hj0B8
         02M4oGZuTCcdXUM2UbXHSmUvRjoByDJCUxUUNEVncCQDNEZCMIOul7fCctFS1LOhUGqf
         ShGgbAgEll+kQCf5R4Dpqlma0/aJsmheI8bWXiqJvQsjcmiM8wFdmxxq9dQe6na8Ahyc
         un2XyyIksiw+B/VU8MtYatjEoN8ksuRUpRkx1QFzJPHV972Sipa+urv96R6qOYN+rR+T
         6uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=58fU8wz/MRnYVvG9hVkJSefKiSbVO5jpOlOekUHdxyg=;
        b=gbze5Iic5plmFA0sG6TFr5OaahnSOvh8cQ3gmKBdlx5K0d02m+mA57Y7KNIEexg5k/
         ozVz6iNZ0GzCYNtu5F5qSR7KgJlvVrysONxRyDyaiXIWjH/qgvjZc555SOyeCpyit3w3
         85lCoThu35bSTQPE8K0a2MlOYCmwdZn5id4M9lZiqcsC3fYQ+PqbmoZD/g+BAK/Ow1mm
         BEvtlxhQvQzeAFic5ij2iTpS9NUybPmfWEMv0fV2B4/u2qhsD7FoHaXOZ2ItS/6skzVj
         ctdJwmTi4IRh6RzGEjrU39eMS6fE4mV5WheI/3UzQt3GwtejDQlWdV8zIXM4cdUgjZez
         X4xw==
X-Gm-Message-State: AJIora+DOWscF22HScyjz5+auk52i4o7ZGH5z/b5pVt50MR/3teVQqPc
	A83QOIzbgnksTWtIQnZBBuvUa1STGv8vvjnSq9k=
X-Google-Smtp-Source: AGRyM1uVeEJi1uHSegCvL2QEAIGtzs0Hkr4/MDo5cVfn1Gk7cXF30CvO11Cp6R8nVAll9uv7Of/9yA1x+AmmeaeMnag=
X-Received: by 2002:a05:6902:38a:b0:670:aa12:8908 with SMTP id
 f10-20020a056902038a00b00670aa128908mr2463061ybs.446.1658343691973; Wed, 20
 Jul 2022 12:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207190634.ToyhlXSz-lkp@intel.com> <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
In-Reply-To: <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Wed, 20 Jul 2022 12:01:35 -0700
Message-ID: <CANRwn3R48rvwnygdyKhmFE8wD+BCCHrTWa-M=uTvpnK5Jo3vww@mail.gmail.com>
Subject: Re: [PATCH] i2c: Use u8 type in i2c transfer calls
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>, 
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-iio@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 5:21 PM kernel test robot <rong.a.chen@intel.com> w=
rote:
>
>
> Hi Jason,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on wsa/i2c/for-next]
> [also build test ERROR on linus/master v5.19-rc7 next-20220718]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:
> https://github.com/intel-lab-lkp/linux/commits/Jason-Gerecke/i2c-Use-u8-t=
ype-in-i2c-transfer-calls/20220718-233658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> i2c/for-next
> config: hexagon-randconfig-r026-20220718
> (https://download.01.org/0day-ci/archive/20220719/202207190634.ToyhlXSz-l=
kp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project
> d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
> reproduce (this is a W=3D1 build):
>          wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          #
> https://github.com/intel-lab-lkp/linux/commit/9732240c23a365c0590f05ce831=
96869235a2ea7
>          git remote add linux-review https://github.com/intel-lab-lkp/lin=
ux
>          git fetch --no-tags linux-review
> Jason-Gerecke/i2c-Use-u8-type-in-i2c-transfer-calls/20220718-233658
>          git checkout 9732240c23a365c0590f05ce83196869235a2ea7
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/iio/adc/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/iio/adc/max1363.c:1645:12: error: incompatible function pointe=
r types assigning to 'int (*)(const struct i2c_client *, const char *, int)=
' from 'int (const struct i2c_client *, const u8 *, int)' (aka 'int (const =
struct i2c_client *, const unsigned char *, int)') [-Werror,-Wincompatible-=
function-pointer-types]
>                     st->send =3D i2c_master_send;
>                              ^ ~~~~~~~~~~~~~~~
> >> drivers/iio/adc/max1363.c:1646:12: error: incompatible function pointe=
r types assigning to 'int (*)(const struct i2c_client *, char *, int)' from=
 'int (const struct i2c_client *, u8 *, int)' (aka 'int (const struct i2c_c=
lient *, unsigned char *, int)') [-Werror,-Wincompatible-function-pointer-t=
ypes]
>                     st->recv =3D i2c_master_recv;
>                              ^ ~~~~~~~~~~~~~~~
>     2 errors generated.

Wolfram and Jonathan,

Writing a patch to fix the new warnings generated by my I2C patch is
simple enough, but I'd like some help coordinating getting both
patches landed. Should I wait for the I2C patch to land in "for-next"
before sending the IIO fix, or would it be preferred to send the IIO
fix right now so that both patches can be reviewed simultaneously?
