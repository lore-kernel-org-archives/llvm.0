Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58527EFE3
	for <llvm@lists.linux.dev>; Sun,  8 Mar 2026 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933591; cv=none; b=A8eanDkzRMVPOmRc4at/brSXrv8YqHozbD+qEEZKKmtSu1ENhrjLanKvPdBLz9TZ4EzgQDM+qCUu+//JBZlGI+GgD84B6DRWFe9sKU68B3txPCBF4bGiu+7wlNGLUlBkH8Im/oMzg2l3LZbaghpWdYyJOPvoDP7B3+gpXfvZIXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933591; c=relaxed/simple;
	bh=BZaVB0PGub7quNOvRQbUSuh4FdW9oZG7GRXrxA+PYFE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Z6QY9EFLPf2TZ1eUBmfdY/5sHbmhShMwEq+Xlw7aZ8/lXRNg+4EHf6APRDLPYx6DMNa2XqITM739YaPdEBFgVRaa5aGDHu3fiVJHbFeX4w8c5ZUzxI3B80P7tf07l3W51asstSuetDFPOIQnsUj6PZFBKTCHrklMRS+ezFKerLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBIHPZyX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBIHPZyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772933588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=619tTv0AXkQ/SaRudAeFbFqB6fXSz5OBeLw2dkY36PA=;
	b=CBIHPZyX1tOpHf/zSGHRA/9rAjsOMySG56TUg+G5Kl+9hxdpVj5QfdPoaL9jlVGmFhGDyy
	+ZTx8ddXQ32WgbyVE30aoDCAcqZcpTXYi3Tw5sY4JNnyU85OHAQRw3dtkacyGM14h23Cfz
	Fw6Jyt0QdRwcodEWU8gUvvUUhRzfOC4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-XvPUQJkuMrakmdxBS29egA-1; Sat,
 07 Mar 2026 20:33:07 -0500
X-MC-Unique: XvPUQJkuMrakmdxBS29egA-1
X-Mimecast-MFC-AGG-ID: XvPUQJkuMrakmdxBS29egA_1772933586
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B9FF19560B7
	for <llvm@lists.linux.dev>; Sun,  8 Mar 2026 01:33:06 +0000 (UTC)
Received: from [172.20.96.208] (unknown [10.30.44.37])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DBC2B180035F;
	Sun,  8 Mar 2026 01:33:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc2,
 upstream-mainline, fb07430e)
Date: Sun, 08 Mar 2026 01:33:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <06449.126030720330700180@us-mta-669.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KZ8En6SaqybS6eFGnDe9JbyMHX1g61XR3XIzGAcnqX8_1772933586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'fbdev-for-7.0-rc3' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/deller/linux-fbdev

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2370696579

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora: avc:  denied  { create } for  pid=3D1 comm=3D"system=
d" name=3D"io.systemd.Hostname" scontext=3Dsystem_u:system_r:init_t:s0 tcon=
text=3Dsystem_u:object_r:var_run_t:s0 tclass=3Dlnk_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2443788
            Affected tests:
                Boot test [aarch64, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
        Issue: selinux-policy: serge-testsuite: /bin/sh: line 1: ./scripts/=
recordmcount: cannot execute binary file: Exec format error
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1507
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

