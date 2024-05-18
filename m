Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75BABE49
	for <llvm@lists.linux.dev>; Sat, 18 May 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716045132; cv=none; b=dk2PT7WriazRbQVgmAOmHz+zdX7uSikk6pcX1lP0fZr6U4rd1ONNCfUt607hUbb+9jAzeCqri7Dhe1MJqAAPj+b2pe+EFHK1ibApOe6DEhCTIETF42ERlePj0hEy8YBM0ZL78fFUB1fejbGSPtmWrsqm1kYllNrmDYpkiz45WSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716045132; c=relaxed/simple;
	bh=h6qMxkjgxNuC3UtDiOpXzCKuAY7nk1RXtkmgs+2/5EM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qceED70P95Hb1/V70w+XrXniknioTNtCWnLqeoKRthNI9vceEj3k07/7S0WI7/ejFSOIqwIh0uAEtW6zlx+9X+T47g989ia1A0eEZqiRRU7URut1fRMWxUk3hlzqOWmd2sL9Wo2Vcub7bDIBlJfxKx4j/yTJe1QK1VKGfaWc1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5CRwrnj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5CRwrnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716045128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FtCDrdPLkssi0eBNqLy8cnF76bomHwI3xmxPflKzX1A=;
	b=S5CRwrnjtgAox6xAaghoEigsdseCdHBRb2yXU/X6KHppSg8jCsI8Mi5+YaYIH5bWOZLeCi
	Oe4mx1yGsdmJiGirIaSpVB77IO4L4Uhw2WoLvt/FP5U0BQXjb+rW8w3ZSxFBRa10OO2NJY
	pbOQrw/haqEwj2VuQDNJ7ch9sj2UMXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-Fo8ZZUQvMwysfstwWvNXyA-1; Sat, 18 May 2024 11:12:07 -0400
X-MC-Unique: Fo8ZZUQvMwysfstwWvNXyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5AEF80017F
	for <llvm@lists.linux.dev>; Sat, 18 May 2024 15:12:06 +0000 (UTC)
Received: from [172.64.13.32] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE0CA40105B;
	Sat, 18 May 2024 15:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 4b377b48)
Date: Sat, 18 May 2024 15:12:05 -0000
To: xzhou@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Message-Id: <94415.124051811120700181@us-mta-267.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: kprobe/ftrace: fix build error due to bad function defi=
nition

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1295796813

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1295796813-x86_64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1295796813-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/001
                       =E2=9D=8C FAIL generic/100
                       =E2=9D=8C FAIL generic/123
                       =E2=9D=8C FAIL generic/590

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                AMTU (Abstract Machine Test Utility) [aarch64, ppc64le, s39=
0x, x86_64]
                Boot test [aarch64, ppc64le, s390x, x86_64, x86_64 (debug)]
                Filesystem - Loopdev Sanity [ppc64le]
                Hardware - Firmware test suite [aarch64]
                Hardware - pciutils: sanity smoke test [x86_64]
                kselftests upstream - bpf [x86_64]
                kselftests upstream - net [x86_64]
                Libkcapi AF_ALG test [aarch64, ppc64le, s390x, x86_64]
                Memory function: memfd_create [aarch64, s390x, x86_64]
                Networking cki netfilter test [aarch64, ppc64le, s390x, x86=
_64]
                Networking vnic: ipvlan/basic [aarch64, ppc64le, s390x, x86=
_64]
                POSIX pjd-fstest suites [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
                stress: stress-ng - cpu-cache [aarch64, x86_64]
                xfstests - btrfs [x86_64]
                xfstests - cifsv3.11 [x86_64]
                xfstests - ext4 [x86_64]
                xfstests - nfsv4.2 [x86_64]
                xfstests - xfs [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
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
        Issue: [rawhide] SELinux is preventing systemd-userdbd from map_rea=
d, map_write access on the bpf labeled init_t.
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2250930
            Affected tests:
                Hardware - Firmware test suite [aarch64]
                Networking cki netfilter test [aarch64, s390x, x86_64]
                Networking vnic: ipvlan/basic [aarch64, s390x, x86_64]
                POSIX pjd-fstest suites [aarch64, s390x, x86_64]
                Storage - blktests - blk - upstream [aarch64, x86_64]
                stress: stress-ng - cpu-cache [aarch64, x86_64]
                stress: stress-ng - memory [aarch64, x86_64]
                xfstests - btrfs [aarch64, x86_64]
                xfstests - ext4 [aarch64, x86_64]
                xfstests - xfs [aarch64, x86_64]
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, x86_64]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, x86_64]
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


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [ppc64le, s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

