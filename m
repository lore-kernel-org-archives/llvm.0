Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD113D51C
	for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 01:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773539531; cv=none; b=HZxE/U6Z3PGSab64zFKfeJ++0D1ad05yedobc5NRtIZLPZqGziqEDmjpyXMtH0GAGpZyHBYHZJx948gua1iMCEpb3x67nQ/EmHMHxyq6qmGAX174ZLF23zSIF95QUfovMjzJ3TyQ/zBiHk0ZEwxnEbbz0imsyoW7womZ2Y4M2jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773539531; c=relaxed/simple;
	bh=sQpYk/tPZrDFr2ttv6WeIJA+uIC695a9Zf1J7zhDRlo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QB4iZGVq8NujIzDkAB7X3wZerXsnF2xQ9PPvrZdVfgA2s5u17la11lCT3D6wguJy7XfQqRWH7PZktZZWoNv6330KIjpEG8LE0+U23/AqlDG/aOVmOw2R3uVOX7M7fdgZy9db+cX82oYQgnDc15fC5GSwek//qgbEzdxifx8lrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcYs9sHY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcYs9sHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773539529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J21T65xcF+Am5s0q+DXcdNI2hgxkjn3hDD75xTDdVhg=;
	b=FcYs9sHYXmVueRk8ISAagqSmChdEx3cqHT9mMc2JMyfzZTKM2YWElZjD54ZNi/h2DN6/SL
	U3WBEcGYtlM+PABEyEKIT2+48VI7P+n1TZnMKC0wcf1Zzq/Qrbq9TGDShbVkIi5c+ODK2l
	R/l7GEJv+RboB+dTaVeoR5RvrMzmCrY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-5rxO4v4MNl6cSme58GOiXA-1; Sat,
 14 Mar 2026 21:52:07 -0400
X-MC-Unique: 5rxO4v4MNl6cSme58GOiXA-1
X-Mimecast-MFC-AGG-ID: 5rxO4v4MNl6cSme58GOiXA_1773539527
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C458B19560AD
	for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 01:52:06 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50D38300019F;
	Sun, 15 Mar 2026 01:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc3,
 upstream-mainline, 26759479)
Date: Sun, 15 Mar 2026 01:52:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <86454.126031421520700327@us-mta-674.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZHM7Iw7mOvsVGrqUvH5fzSpRKKk7hAzYwqqjMl_RiqU_1773539527
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
    Commit message: Merge tag 'rust-fixes-7.0-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2385559170

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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

