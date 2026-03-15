Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1055B5AB
	for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773540130; cv=none; b=de7zRoVS94VJ42NLDJux8+25ODmXfnl1EjeTgSMS6B74ivBhf2rKAgNyRhAmrn1YLVnPrd6HfHULBJVey0JWYe+ST1o8rBZbSxZl4GJPsnkfbimnX3z7dvvK4+EmEOZsfozZPEC2Rj9pBefph/MSvf26lmVkHjqYwHx0SMFd3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773540130; c=relaxed/simple;
	bh=59OcaL7wr4rrn2QJFNuKWnrszyxL2pi37n3sLg1ki0U=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BAnwV2yjPPMCpNfeHb21ytzzoCJfUmqsmUvYTPeFCXAuB3RNnfw50tO79tRlX9uydvdFjHhzeXUZjHPl1Ol36JZ7mT0Z9GovG9x3/8i9P8orkqSpPvT7RBAmhyPnH3gC/Ye9qL1Do/qfQnn2h9/sUIJ/V1Id1tAYgWMIoeJXAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wm7se7lr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wm7se7lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773540127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uk09VKWjHu2sOoAqwOkD51f1iNAtRWuLbtk27xdQ0DU=;
	b=Wm7se7lrRFp7sleedEISj3rlVXlMbX1iYQuLOqK9bVrmqaxyLsXhNQOwg2ANiYJd3KMqaO
	xWvbi8ciAjSLDOZHeJur6+VWI6e1pG7aRWfS9UPlyvaiv0DjFQGqPl2CBWUaIpH4SuOvpq
	POgHgg9crN+477M7N1SKgEPzZRRVQag=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-hHzLAq6LOpuoLJ9UP9ZzsQ-1; Sat,
 14 Mar 2026 22:02:04 -0400
X-MC-Unique: hHzLAq6LOpuoLJ9UP9ZzsQ-1
X-Mimecast-MFC-AGG-ID: hHzLAq6LOpuoLJ9UP9ZzsQ_1773540124
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E275F1977405
	for <llvm@lists.linux.dev>; Sun, 15 Mar 2026 02:02:03 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95248180075D;
	Sun, 15 Mar 2026 02:02:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc3,
 upstream-mainline, 69237f8c)
Date: Sun, 15 Mar 2026 02:02:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <08896.126031422020400303@us-mta-448.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wh6yBfy68e8Myz5SXP0sYcS4OLs8MiFyAtLQa1KdqHM_1773540124
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
    Commit message: Merge tag 'usb-7.0-rc4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/gregkh/usb

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2385475144

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

