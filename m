Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C40286A4
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 04:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685189; cv=none; b=dvthJjpaesntcn+poRw8Bj5J9z1/t7qxdb04m+DVcTBgfOOeNf/f1ITArlbo0oUe2AwdzZp3QQjx7mWyBIMlDSvkeLi+8wtlCsSWBUUSelFVdVHaN0i/MgNEd7CCwysytzSDGeL8xDTwBYCARxNv2gKFnAudUHX5IpfbssZtyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685189; c=relaxed/simple;
	bh=yC9C+dVlDX/WCefmdqkBEZN5QbC4eT/Bz4zRAyk0Ky4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=f2MCn6qkDvjVsrvn2Pv6k4HNdPnbvqplKzgWQGgl5YHj+hXwX1aHP/1pNvmVETijB5TP+V/L8VBficIKolJM+V6rB4AppAsbvF4GJ1jNaQCGhMOFM6czAxJXbxjU0LaIKeLRfZMuR6tyouYeaVVo3c1TUghSIJ5pen9n1WJ2r28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcqqybgE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcqqybgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772685187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zrTLQDBH6Odc+VWx95XKLuKqqwvwo7q9pm2LAkZ7+7k=;
	b=fcqqybgEX4rJDfY1yoojgY+8Bqz3jnLNwYcOIzWI4CPsPyli5HDzMLBLgMdi+kqPLvJ/yx
	HwLks36Byde1eKBXE8dpby887nPXh9gb8YO1z6Qb3OBXLM6uI+xcZ1DNNaZn4r28fgE+ri
	LmLiyLeb/jUYs5/4/yQALc8qKeqT6qw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-ZZr1DeaKN7CFcgmPFzzMLw-1; Wed,
 04 Mar 2026 23:33:06 -0500
X-MC-Unique: ZZr1DeaKN7CFcgmPFzzMLw-1
X-Mimecast-MFC-AGG-ID: ZZr1DeaKN7CFcgmPFzzMLw_1772685185
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 55C9F180034E
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 04:33:05 +0000 (UTC)
Received: from [172.20.96.208] (unknown [10.30.44.37])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E8F8C30001A1;
	Thu,  5 Mar 2026 04:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc2,
 upstream-mainline, 0b3bb205)
Date: Thu, 05 Mar 2026 04:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <26268.126030423330600473@us-mta-453.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sZcF8flEWv_5Ueb6yz5eb2ErJ6Kni0E8YwtFu8agTZE_1772685185
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
    Commit message: Merge tag 'vfs-7.0-rc3.fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2364849586

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

