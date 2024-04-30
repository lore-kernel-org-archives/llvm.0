Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2FB17106E
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714482106; cv=none; b=lH4VN3f+k98IZb2G2fOKT21dJtQce36NNQGjRS7Iwhx6jAFOkcv39Q0ty9rXqITTibbVUpBvurcSqGZ/+d1BDmPBCqrlYVch9tvgoNza7NcyTdxGJKsvf/b1mD2fz3QS3pZgmXHUPAEA+ojDDYCFD81tf8vAf9T2RsNG2HZ4Rfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714482106; c=relaxed/simple;
	bh=+16Tff3/RR6SJfO7OjLiiuOHjOv+adaxbqVX/91dVLs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UAT1HHXol858Qxd5xIUb8Z/kBiYGMfKL94zPJEEZxFgpTrgHI5dD5Zuz1l11MsHslLkRMxq97lC3CTDjzLw5iBgEBYRHp3Y4+WEFZUUkc+69g18pS6yaMhNt2CXrl4THwXnr0COkNd8kHl+nUJL9XNCBm8YI+AsMFbcDzv9wedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PG9X45j6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PG9X45j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714482104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CHw4xuU/5UijhVZXQnQc/P0uyfWP/rsaEbK7XVJUNlI=;
	b=PG9X45j6zis7GxN5J9gmTVIdMN/oNnYekCAyrjoxd8JYnlRD49X12s68D7r2uQHMt417mK
	DcQ0qaZhwhcKuFHIHn6C1OcyRKgdJSWf4sTHOxcP55lJkkTkQZ1I+lfrSShH/fYGIwPMj1
	SKCR1iBEWQtK/mDct23mi5eVg+pW0As=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-kKaBGpdjNBewjL7SI88jjQ-1; Tue,
 30 Apr 2024 09:01:42 -0400
X-MC-Unique: kKaBGpdjNBewjL7SI88jjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3725C3C12822
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 13:01:42 +0000 (UTC)
Received: from [172.64.5.14] (unknown [10.30.32.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E805F400D288;
	Tue, 30 Apr 2024 13:01:41 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 5 of 204): Test report for master
 (6.9.0-rc6, mainline.kernel.org-clang, d03d4188)
Date: Tue, 30 Apr 2024 13:01:41 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <26340.124043009014200933@us-mta-187.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
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
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1272469110

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [s390x, x86_64]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: [Rawhide] kdump - kexec_boot: [ ERROR ] :: Kexec boot failed=
. Expect to see newkerneloption in kernel boot options
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2057391
            Affected tests:
                kdump - kexec-file-load [x86_64]
        Issue: kdump - kexec-file-load: Kexec boot failed as fileloadoption=
 is not seen in kernel boot options
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1433
            Affected tests:
                kdump - kexec-file-load [x86_64]
        Issue: [upstream] [eln] waived call traces we don't plan to report =
upstream
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1864
            Affected tests:
                Boot test [x86_64 (debug)]
                Reboot test [x86_64, x86_64 (debug)]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
                Filesystem - Loopdev Sanity [s390x]
                Libkcapi AF_ALG test [s390x]
                machineinfo [s390x]
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]
                Reboot test [s390x]
                Storage - blktests - blk - upstream [s390x]
                Storage - blktests - nvme-tcp - upstream [s390x]
                Storage - swraid scsi_raid [s390x]
                stress: stress-ng - cpu-cache [s390x]
                stress: stress-ng - memory [s390x]
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]


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

