Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B325A343
	for <llvm@lists.linux.dev>; Wed, 12 Nov 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956193; cv=none; b=avDNQ4RKfFIqu/3aCUWeKE5rhk0FVgOIV4dSzVbAatmdVoWd0KrDWuBedveHQIalYYXsDY7I1rodMgzr8epvWkXOsaQEsdDJIVuX5dp6BbzIgqV3hrjb4W3hYQU5sQym12FAfF0hFeoTdf/M7+j3wp1uoJ3ESGb6Ut65ewpXbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956193; c=relaxed/simple;
	bh=RfOcoBIBCR2D14w+726i7dNWQ6hdH9+XhAKl6PG/I+g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ac2lEVGuXM0OZTy6hIsy8e7BB6PpwBRTOONfwem4IDwl0bQ0WlQuYwhdyuFJrGemBHOmaEQ+P0QRO6hd0+xoTbVsOb1cwQ11jzBvyhDGEn2GypN1DCLV7NTP3rc2zf8RtR6v+kgOOthLGBt8dtIVxJ75F2sGNmF3NHfQOkoGRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PV+AWGGM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PV+AWGGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762956191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B/ySekrdOB/pbimbz01uGErisiqPcGb469Px5CcbQPE=;
	b=PV+AWGGMoRLlufDmFDiFqtt8CN8dqNSKdbX5l2vO2iW0GO0irmZW3mSVnUb7h9zM3iHTNg
	vav7RduAMb08acii5SbV5yGP7PXws9AI6cT5xdyUUpvdbMM1pWH1A8xDqyzlNUDZq0AkrB
	xLt+x411JeO44dECd7jt4cF/VJrWBJQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-dnKFxROSPNKnLUMPRy6W_g-1; Wed,
 12 Nov 2025 09:03:09 -0500
X-MC-Unique: dnKFxROSPNKnLUMPRy6W_g-1
X-Mimecast-MFC-AGG-ID: dnKFxROSPNKnLUMPRy6W_g_1762956188
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D460818002FE
	for <llvm@lists.linux.dev>; Wed, 12 Nov 2025 14:03:08 +0000 (UTC)
Received: from [172.20.120.109] (unknown [10.30.44.79])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 640A7196B8F7;
	Wed, 12 Nov 2025 14:03:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 4 of 137): Test report for master
 (6.18.0-rc5, upstream-mainline, 24172e0d)
Date: Wed, 12 Nov 2025 14:03:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <29909.125111209030901235@us-mta-373.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nBDTb9S78qOFPtqtIoKXmB5lzTaDuUIGHP7R0T2KUnI_1762956188
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
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2153034227

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: BUG: KASAN: slab-use-after-free in nfs_local_call_read
            URL: https://lore.kernel.org/linux-nfs/aPSvi5Yr2lGOh5Jh@dell-pe=
r750-06-vm-07.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/command [x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    Reboot test [x86_64]


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

