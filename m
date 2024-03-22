Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1BDA32
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711089089; cv=none; b=dK+jFH+OcSHxzvNCAfNAQ+53Y3Nnob2ztUEWgedoXb2dKGfG8+0qptB6kj4jR2qSIHQGJejVVduYMF73y22gYLYrhOzQZpOnKQOad/bA/erJ7rlM0Hv69UPeVSKy63Lsl0rbw7MgCUJyqnyVKi/SkbhEYdv6zB1BsehUODxS/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711089089; c=relaxed/simple;
	bh=POd3ZswqRrHG3JgCesWjzK53JBxs6RNC9qTwhqJkivU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fbOlOPRoLPoEU9Hl9xQzddH/Cvj1dEfRx2dwmEFmpGioEi5hougTw/nQuEuF7WRmhWYTMZeVzqoFw6tCb04/zt1z/BLg+CsRwIjb/aON5APs9UyRV+0xsYcpbaDALkU0PxTWyMph1VQc4vQrqkWMK1ELajzGRO5N1vLm5N/2XH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WR97s43A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WR97s43A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711089085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GhRb0NcYR174E3St+2NldSLURuRdscVA6RaWSWL6hyo=;
	b=WR97s43AxVNQRRvTPf8ADKOx7niZP0P9cY4LE+92/aSeX202BUlUVG7jI/YgiBxWoxmpfo
	11py4rBM2wpCHZ2X5uUUydPQKimFdQNXFt4IxXDGZOlzIdm1JrtMX6ftdEes7jISBKC8VC
	V0zja2epUlmZJKbWLpp05/GeA7Dip0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-ZaPnqkerNRuBxYR_ZtaG9Q-1; Fri, 22 Mar 2024 02:31:21 -0400
X-MC-Unique: ZaPnqkerNRuBxYR_ZtaG9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E914800262
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 06:31:21 +0000 (UTC)
Received: from [172.64.11.27] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF76C04220;
	Fri, 22 Mar 2024 06:31:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, 241590e5)
Date: Fri, 22 Mar 2024 06:31:20 -0000
To: bhe@redhat.com, llvm@lists.linux.dev, yiyan@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <05884.124032202312100776@us-mta-680.us.mimecast.lan>
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
    Commit message: Merge tag 'driver-core-6.9-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/gregkh/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/136457

One or more kernel tests failed:
    Unrecognized or new issues:
        kdump - sysrq-c
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11758051
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                kselftest build - bpf [x86_64 (debug)]
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
                xfstests - nfsv4.2 [x86_64, x86_64 (debug)]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
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
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: makedumpfile failed when dumping vmcore
            URL: https://bugzilla.redhat.com/2269991
            Affected tests:
                kdump - file-load [ppc64le]
        Issue: [Rawhide] readpage_elf: Attempt to read non-existent page at=
 __exclude_unnecessary_pages: Can't read the buffer of struct page
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2269991
            Affected tests:
                kdump - file-load [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [x86_64 (debug), s390x, ppc64le, x86_64, =
aarch64]


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

