Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDF07081E
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755331; cv=none; b=Xldx5HrdGkGoGKTuh6PG1Wp2CU62N077LzUarDfPhv0I4VeR1SzJsmg/0uBp5D/3yCdq8K9Wqs5Thrv5w2zDk3U4/AINZN0dKFKD4Us4B6ApGoAT0jUTgafuuPS2RpxP2ogtr9qxrByd6f2dLX7FdPwTjSDw2OGGYnVA7W0nzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755331; c=relaxed/simple;
	bh=xSew5Hq3DqH9ifskhZTqLBSL/Vl09mLiHyCNUB3R8iQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UZUVMFpEeROJLW947aAI8T0Lsfqjm45lEHrUEuc/9HNmJnRGsQJSGqmzDT9aYMd7VPFVhsDMaNregopXM4OVy59aw/CwqkP9vx/3uv20dTMj0vFERsGs9n6Si7DZWyRhGZBCv41BAk8NQe56jPiXCzUa3qArMqglhqlUNynMDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2/Xs7GZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2/Xs7GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772755328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PQg4mA65hFCsS/qYvSzO/8dF9QzXfVrIRjvflNGk/Co=;
	b=g2/Xs7GZjqeKO1tE6dsf7iOXubPh6A+UWFCWSr7YYtVJQbfL1Cm2R0VFmTyOJiXN5tczaO
	qwpDcfVFZVe/9fNAk2xWz8Jgd5iUjbrFBt4JmTgATzt3pzJHO2I+KuE3qbrNBxETLoDufA
	G8LzPCUZ4tAp6HniUsDtZJRk23XiA6g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-AOvXPzpJObmJmazcUCmMEQ-1; Thu,
 05 Mar 2026 19:02:07 -0500
X-MC-Unique: AOvXPzpJObmJmazcUCmMEQ-1
X-Mimecast-MFC-AGG-ID: AOvXPzpJObmJmazcUCmMEQ_1772755326
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7006E1956056
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 00:02:06 +0000 (UTC)
Received: from [172.20.96.208] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0FF921958DC5;
	Fri,  6 Mar 2026 00:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc2,
 upstream-mainline, 5ee8dbf5)
Date: Fri, 06 Mar 2026 00:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <37622.126030519020700323@us-mta-232.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5-7SGyNkixjS15DOVTnzObZr0eB6Xq2Q3yfYn7v6bhI_1772755326
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
    Commit message: Merge tag 'fsverity-for-linus' of git://git.kernel.org/=
pub/scm/fs/fsverity/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2366982170

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora: avc:  denied  { create } for  pid=3D1 comm=3D"system=
d" name=3D"io.systemd.Hostname" scontext=3Dsystem_u:system_r:init_t:s0 tcon=
text=3Dsystem_u:object_r:var_run_t:s0 tclass=3Dlnk_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2443788
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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
        Issue: selinux-policy: serge-testsuite: /bin/sh: line 1: ./scripts/=
recordmcount: cannot execute binary file: Exec format error
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1507
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

