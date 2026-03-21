Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6DB23ED6A
	for <llvm@lists.linux.dev>; Sat, 21 Mar 2026 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774081393; cv=none; b=RkX1JpzM6cxmUPjNkaozjxz9bkjDhw0xV9gfQ2hMmF9pFQqag0R36d+knwbJi2pCJv0VuPBM0AR7ijmiUYXimeFD4sWSvd7Vn6gB6GOpZvcWM3UId9UFys4PPTI4Km2Yy+zWPc7XFB2X3cM5xR3R4Uz6Ph5yyligOzHQaeJQ6m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774081393; c=relaxed/simple;
	bh=d5w9352ECD9deMld7hyJXTYKM1iw5QtHArWbnC5q6QE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ClY3b3KqDCBrgAOmxnlpV8ThrS+mFZbmagF37Jk0WOLLRSE2iYTiwKEhk7HER8BzXDsdurPDV5Jrwqmsmg/y0vj+8XhdA6NCejqaA6rwWB3Z73IvVDhhDVdYRt2IPep61DVblX9Ivri9VewZWdq4JjvrPwuxxy9lb0axy818EC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UdHAZE2l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UdHAZE2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774081390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=++RzTe95Hvfd3c+Ce44yHLyWxHB7z9RFLNk7HfnkqNg=;
	b=UdHAZE2ldpN2t30RrY8MvSzvFL1vjgEY+rA63Y4/CKoUOHVvzVtH9nXt683clwNcS/lfUG
	cpm6nsttScBFx7LCLgIQa4zeJb4YVWHqAasjmce77BGGnstbj4CHS04bTNDBmEmDuh9JTC
	62c8lOtaOfejQrwm+B6pY6/j+LA/b2o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-H1Ky1VHjPXmxDJ47mo2kdA-1; Sat,
 21 Mar 2026 04:23:08 -0400
X-MC-Unique: H1Ky1VHjPXmxDJ47mo2kdA-1
X-Mimecast-MFC-AGG-ID: H1Ky1VHjPXmxDJ47mo2kdA_1774081387
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B74DF19560A2
	for <llvm@lists.linux.dev>; Sat, 21 Mar 2026 08:23:07 +0000 (UTC)
Received: from [172.20.168.233] (unknown [10.30.45.63])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56DDF30001A1;
	Sat, 21 Mar 2026 08:23:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, 16516026)
Date: Sat, 21 Mar 2026 08:23:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <97161.126032104230800541@us-mta-158.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qe6JAMaGCXgKezFS4iRkybHyKQc6MuIZtaE18G_jn6Y_1774081387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2398675209

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2398675209_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] [eln] waived call traces we don't plan to report =
upstream
            URL: https://issues.redhat.com/browse/RHELTEST-137
            Affected tests:
                Boot test [x86_64]
        Issue: [upstream] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1920=
 at drm_atomic_helper_wait_for_vblanks.part.0+0x228/0x240, CPU#1: kworker/1=
:1/54 - RIP: 0010:drm_atomic_helper_wait_for_vblanks
            URL: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.=
0017.GAE@google.com/
            Affected tests:
                Boot test [x86_64]
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

