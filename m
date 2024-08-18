Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5817C60;
	Sun, 18 Aug 2024 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723975651; cv=none; b=vC91d1PwWPU/nil28GWpF8MH/uThlHL9PZnG3VxASsIcfXgT4Bn+cKq6rNBuq29ByT9AJWzjUpMru+UK612n3bo4Tq7mpVf0M8cXrYavN9PK1dZq04ZmilaqUVnOVzXbr8XEQWBg4rCo5RaIc03KoU08YKq19PnWI3GJeicVCa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723975651; c=relaxed/simple;
	bh=RQ0T3ucmyl3SMTk7sFNGK2rgHNQUl85vksfrOniaezo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CNk07ch6wWfWTe4WotETvJiZADRX1Y3bjlLi/fmq/o4fZLn4+Ho6fJPbUWXeLldor1bGFsDatKSwFo38UT0IHph1I63aa3Qy3n7LydcXJeeePpemW9MzXmp0hZVM7iJQ37/OFmucgIaYgUrSWk5cFhSwekYD4izGyfQUtarZ0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wmrt774Vwz6L779;
	Sun, 18 Aug 2024 18:04:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 58C06140680;
	Sun, 18 Aug 2024 18:07:17 +0800 (CST)
Received: from frapeml500005.china.huawei.com (7.182.85.13) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 12:07:17 +0200
Received: from frapeml500005.china.huawei.com ([7.182.85.13]) by
 frapeml500005.china.huawei.com ([7.182.85.13]) with mapi id 15.01.2507.039;
 Sun, 18 Aug 2024 12:07:16 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: kernel test robot <lkp@intel.com>, David Howells <dhowells@redhat.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [dhowells-fs:pgplib 8/14]
 crypto/asymmetric_keys/pgp_signature.c:26:3: warning: unused variable
 'pgp_pubkey_hash'
Thread-Topic: [dhowells-fs:pgplib 8/14]
 crypto/asymmetric_keys/pgp_signature.c:26:3: warning: unused variable
 'pgp_pubkey_hash'
Thread-Index: AQHa8JV109ngZZFO5UiHJLxvSazIcrIsyUvQ
Date: Sun, 18 Aug 2024 10:07:16 +0000
Message-ID: <a1ac74bdeb0c4675aa801ba566a72c7e@huawei.com>
References: <202408171901.P92A9eD1-lkp@intel.com>
In-Reply-To: <202408171901.P92A9eD1-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> From: kernel test robot <lkp@intel.com>
> Sent: Saturday, August 17, 2024 1:06 PM
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs=
.git
> pgplib
> head:   f5bc37208146cc7ce38c4ad5a403e00904c0b6d2
> commit: 4687723ce751ddc2429ed0cbfb2bf1e56658ace5 [8/14] KEYS: PGP-
> based public key signature verification
> config: x86_64-allyesconfig (https://download.01.org/0day-
> ci/archive/20240817/202408171901.P92A9eD1-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project
> 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240817/202408171901.P92A9eD1-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202408171901.P92A9eD1-lkp@intel.
> | com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> crypto/asymmetric_keys/pgp_signature.c:26:3: warning: unused variable
> >> 'pgp_pubkey_hash' [-Wunused-const-variable]
>       26 | } pgp_pubkey_hash[PGP_HASH__LAST] =3D {
>          |   ^~~~~~~~~~~~~~~
>    1 warning generated.

Ok, this is due to the fact that struct public_key_signature
changed, and hash_algo is now a string instead of an enum.

Thus, I went for directly using the pgp_hash_algorithms
array in pgp_sig_parse(), and pgp_pubhash got unused.

pgp_pubhash can be safely removed.

Thanks

Roberto

> vim +/pgp_pubkey_hash +26 crypto/asymmetric_keys/pgp_signature.c
>=20
>     23
>     24	static const struct {
>     25		enum hash_algo algo : 8;
>   > 26	} pgp_pubkey_hash[PGP_HASH__LAST] =3D {
>     27		[PGP_HASH_MD5].algo		=3D HASH_ALGO_MD5,
>     28		[PGP_HASH_SHA1].algo		=3D HASH_ALGO_SHA1,
>     29		[PGP_HASH_RIPE_MD_160].algo	=3D
> HASH_ALGO_RIPE_MD_160,
>     30		[PGP_HASH_SHA256].algo		=3D
> HASH_ALGO_SHA256,
>     31		[PGP_HASH_SHA384].algo		=3D
> HASH_ALGO_SHA384,
>     32		[PGP_HASH_SHA512].algo		=3D
> HASH_ALGO_SHA512,
>     33		[PGP_HASH_SHA224].algo		=3D
> HASH_ALGO_SHA224,
>     34	};
>     35
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

