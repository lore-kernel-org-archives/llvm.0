Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C617A2E6
	for <llvm@lists.linux.dev>; Sat,  3 Jan 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767458344; cv=none; b=WPEU3Oe1iQPInTudL4nEa0AmUbvDGB7H3fVVE33wzYGr4bbUUbiFXmxGCteR8Vyod0z9rPjihlpdZJO2MV2TJTXH6P0SRP92aiEb8ENPKg+JMHzF/WyaHhjoWrgHoeAKi+HKUsILRSicYX7PcUwc2N1j3yDQeeOmpRfJeI+WmxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767458344; c=relaxed/simple;
	bh=QT63Ti3q/SCnbDRo6KFkzp3ZWmdRyhhSiDnAwSSK2H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLzDN3TY4jr1eXTz6qCi8GvX2i5qFGvFTUliVt5I+whzR4czYuuQzkKPVWGO7wVuLdHfnc+DoxverOidnnszoUaCeJVTuyK5EDWgOQY26issA1+BErY1Xw2vat5lcGbKnExf3mOeTYzPGelzMb4r1Xs6+RIEuSOSGYQkCrLu48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxTuWtf9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxTuWtf9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so21415826a12.0
        for <llvm@lists.linux.dev>; Sat, 03 Jan 2026 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767458341; x=1768063141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ0VJpwmuH/ycL+AbQbUQmziZafv9tzUCJiuILeRekU=;
        b=fxTuWtf9aDXXchMy/tPpJQ4wP5pGY4UG21Q2L3IaJUPiKTbm89aAkabY8BSWImUk9Z
         Y6+M2RlzHDEa7FxeZJq0zejZpwPgfjTXd+/5YwJzkfHTQ5S1QObzFfRyCTJGDzqcGpEf
         n3dR7JrdeXTMIKtx2gBUXlv9bEVmCdLjZXP4u/I2MhkVlFvbX+VED101IPreibflBrzS
         D08Mu+QWRWyRruhLwAac+FAc59mdWNesP2QtwqpQRKyxT+HQAPHzqLHevBzMD7JGQhY5
         NuOkTjl6wNRTXR336pjT/Zpd2Iu0ZpInu3esf9T2MKBEcLfYI4FKSe4W5KHeawxul2TK
         kL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767458341; x=1768063141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQ0VJpwmuH/ycL+AbQbUQmziZafv9tzUCJiuILeRekU=;
        b=FuearmXGdhDLlV5YL8ufXXIERota8FE1PQenwHkk4uZACmwF5NCxN3dxQpuIOs1tr/
         TsqPOi/QohBBLMkrDCjiUKSMUbMyDuMeYWpD6O5BDuogH9muQtN4mD2gUnO9QoqKO3CO
         02hTKsOGfU2wfoFZ9Ds+FBfiAssGx5hd66U4ZWnffiOKFBwBERnWRA8D0MOs7pV7FAr8
         t4DysWIirXwMDFGjrt1RGVXT4m+ZHaEqa0hYu811ak50WVwc7lFigL+OYdbEQVUyk1b2
         m4JwIEqVwx7vQMDYk5AKlqEaqucdS7LfuJa7VKbPxT7RgAbPko7P161sMYoivCAF4DhV
         sLKA==
X-Forwarded-Encrypted: i=1; AJvYcCVFqt+aujkosBPuU5+Vu01WuVXIKu9wKaLvOvnLueFRUD0nQf0Koa+ULQJ3k+rMV0CxPzJ8@lists.linux.dev
X-Gm-Message-State: AOJu0YwZs/EChEl1Nw1BLh7K5pzw3Ne5xmXM1ICGC5HkOrv4ckw/zYwk
	pwBt8gLT5gOFmlMNEzE6FbJL0GkJnRQuu0VBBH6LLD76NtTBsu3MPUcjGT76wF44AycZ65TsqMx
	JAuK8kD1+cmfCz2wSauDwsUtn61K3rg==
X-Gm-Gg: AY/fxX4WnhZt5WmA60TlHDGKYeLezE5Dp7OZf5Ho5YxSjjOzCdNtnrZou3qkHFQVYNP
	CwIdlRpcL8a0YjDr5hLEDhZgx8oVnvzZTxqggs1rtysFVsdOACUF6jBH8zaWbx4ZxFwf0/5D9mo
	LzkPCBE+65MMX/rPr6sfdQvu+RwToBiNcCMVt69wfFHFXgofgSX/gpMOlnzX2+avDICZhhJ1YyW
	jPG27W6PI/Dinul5STpKDtQE5WzlYj9P/+v1R99K7spx/zpe7idlcDRmCh9M1Jiqn42sXLN0nvx
	f23dDQOOJOaqPSsTyIdS6VvV9Q==
X-Google-Smtp-Source: AGHT+IFS5LZXNRKTp2yei0I3CKw/OM2zbhooTT4Se5HOpY+maSm+sUqxgjfqLvI4VUITMZajsC7w+TXAWWiHLRZEr58=
X-Received: by 2002:a05:6402:2343:b0:641:3492:723d with SMTP id
 4fb4d7f45d1cf-64b8eb73c83mr44417040a12.11.1767458340417; Sat, 03 Jan 2026
 08:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260102232934.1560-7-rick.macklem@gmail.com> <202601031746.QiLqxADW-lkp@intel.com>
In-Reply-To: <202601031746.QiLqxADW-lkp@intel.com>
From: Rick Macklem <rick.macklem@gmail.com>
Date: Sat, 3 Jan 2026 08:38:48 -0800
X-Gm-Features: AQt7F2rhrjREhLM-aP70saLtnAlEEUUOSWJAx5GCKs1X_akmuiHRNtBhGILOGNg
Message-ID: <CAM5tNy4G+GdOyudAhoo4cw+qVotD3A+sHrm-ksntq6ri3+ba4w@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] Set SB_POSIXACL if the server supports the extension
To: kernel test robot <lkp@intel.com>
Cc: linux-nfs@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Rick Macklem <rmacklem@uoguelph.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Next dumb question. This error is the same story. It needs 0001
from the server patch series.

If I repost this series with that patch in it, this report wants a differen=
t
tag for Closed by:.
Do I put multiple "Closed by:" lines on the commit or just the first one?

rick

On Sat, Jan 3, 2026 at 8:26=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on trondmy-nfs/linux-next]
> [also build test ERROR on v6.16-rc1 next-20251219]
> [cannot apply to linus/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/rick-macklem-gmail=
-com/Add-entries-to-the-predefined-client-operations-enum/20260103-073239
> base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
> patch link:    https://lore.kernel.org/r/20260102232934.1560-7-rick.mackl=
em%40gmail.com
> patch subject: [PATCH v1 6/7] Set SB_POSIXACL if the server supports the =
extension
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260103/20=
2601031746.QiLqxADW-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260103/202601031746.QiLqxADW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601031746.QiLqxADW-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fs/nfs/super.c:1356:33: error: use of undeclared identifier 'FATTR4_WO=
RD2_POSIX_DEFAULT_ACL'
>     1356 |         if ((server->attr_bitmask[2] & FATTR4_WORD2_POSIX_DEFA=
ULT_ACL) &&
>          |                                        ^
> >> fs/nfs/super.c:1357:33: error: use of undeclared identifier 'FATTR4_WO=
RD2_POSIX_ACCESS_ACL'
>     1357 |             (server->attr_bitmask[2] & FATTR4_WORD2_POSIX_ACCE=
SS_ACL))
>          |                                        ^
>    2 errors generated.
>
>
> vim +/FATTR4_WORD2_POSIX_DEFAULT_ACL +1356 fs/nfs/super.c
>
>   1299
>   1300  int nfs_get_tree_common(struct fs_context *fc)
>   1301  {
>   1302          struct nfs_fs_context *ctx =3D nfs_fc2context(fc);
>   1303          struct super_block *s;
>   1304          int (*compare_super)(struct super_block *, struct fs_cont=
ext *) =3D nfs_compare_super;
>   1305          struct nfs_server *server =3D ctx->server;
>   1306          int error;
>   1307
>   1308          ctx->server =3D NULL;
>   1309          if (IS_ERR(server))
>   1310                  return PTR_ERR(server);
>   1311
>   1312          if (server->flags & NFS_MOUNT_UNSHARED)
>   1313                  compare_super =3D NULL;
>   1314
>   1315          /* -o noac implies -o sync */
>   1316          if (server->flags & NFS_MOUNT_NOAC)
>   1317                  fc->sb_flags |=3D SB_SYNCHRONOUS;
>   1318
>   1319          /* Get a superblock - note that we may end up sharing one=
 that already exists */
>   1320          fc->s_fs_info =3D server;
>   1321          s =3D sget_fc(fc, compare_super, nfs_set_super);
>   1322          fc->s_fs_info =3D NULL;
>   1323          if (IS_ERR(s)) {
>   1324                  error =3D PTR_ERR(s);
>   1325                  nfs_errorf(fc, "NFS: Couldn't get superblock");
>   1326                  goto out_err_nosb;
>   1327          }
>   1328
>   1329          if (s->s_fs_info !=3D server) {
>   1330                  nfs_free_server(server);
>   1331                  server =3D NULL;
>   1332          } else {
>   1333                  error =3D super_setup_bdi_name(s, "%u:%u", MAJOR(=
server->s_dev),
>   1334                                               MINOR(server->s_dev)=
);
>   1335                  if (error)
>   1336                          goto error_splat_super;
>   1337                  s->s_bdi->io_pages =3D server->rpages;
>   1338                  server->super =3D s;
>   1339          }
>   1340
>   1341          if (!s->s_root) {
>   1342                  /* initial superblock/root creation */
>   1343                  nfs_fill_super(s, ctx);
>   1344                  error =3D nfs_get_cache_cookie(s, ctx);
>   1345                  if (error < 0)
>   1346                          goto error_splat_super;
>   1347          }
>   1348
>   1349          error =3D nfs_get_root(s, fc);
>   1350          if (error < 0) {
>   1351                  nfs_errorf(fc, "NFS: Couldn't get root dentry");
>   1352                  goto error_splat_super;
>   1353          }
>   1354
>   1355          /* Set SB_POSIXACL if the server supports the NFSv4.2 ext=
ension. */
> > 1356          if ((server->attr_bitmask[2] & FATTR4_WORD2_POSIX_DEFAULT=
_ACL) &&
> > 1357              (server->attr_bitmask[2] & FATTR4_WORD2_POSIX_ACCESS_=
ACL))
>   1358                  s->s_flags |=3D SB_POSIXACL;
>   1359
>   1360          s->s_flags |=3D SB_ACTIVE;
>   1361          error =3D 0;
>   1362
>   1363  out:
>   1364          return error;
>   1365
>   1366  out_err_nosb:
>   1367          nfs_free_server(server);
>   1368          goto out;
>   1369  error_splat_super:
>   1370          deactivate_locked_super(s);
>   1371          goto out;
>   1372  }
>   1373
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
