Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6943233
	for <llvm@lists.linux.dev>; Sun, 17 Mar 2024 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710644486; cv=none; b=HPOdQ+IKdDJI+5dDWtiTeUFv2TIwTbCxiZWi4fy1Y6MKc7zc56wEbYW2t25c1ItrRjoW+H6CBr24AV8hEzZpW2Ph6pu85cp422uNKf1ExhGeajOHcKcQ59z55y95djl+OSEQG1bq0Q2qscSr7IMbWGhEF5G8/rY/vw1UkBm7G9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710644486; c=relaxed/simple;
	bh=NTPFj0m8vIZiL748oSUyycBcUBQBBtMy/ED8JO7Ni6Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WLoqd++YwWsM5n5DO2FQjElPBU+EnMYKblmN9OjRmkbslsXNnWFLkf8//kM9TpEIwosRTHoy6D4gfW778+qrZodqbVmerAF00ESNAvc/lkhAjEi/53nc18FtgavnfHQvFe/265RTxHVbWT+cy/Pcbo6YhpqwuCKDZ0qpvV4NBKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d+BHJ000; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+BHJ000"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710644483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dz+CM3C3/ho6ed765sWS/vqNhjdb7eo+aEx0emaj6TU=;
	b=d+BHJ000FFWu2N6mU2JZ+9SOSyueKJxEjfrb6OQhpt/xeVu2HEeff04pj6PKvJc9GRaghE
	ItK9spN+WdM0VkEgyCDYP6id6ftXQmTKU3CSZkFqg3D4nx+8RnjCBsxNZ0WX1stnVc3MNc
	gzqfL1NislkRj95lrljVCegVyYt5Wvo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-Gj1kDj_jMgmqVyD7UWynMA-1; Sat,
 16 Mar 2024 23:01:17 -0400
X-MC-Unique: Gj1kDj_jMgmqVyD7UWynMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D661C04B4F;
	Sun, 17 Mar 2024 03:01:17 +0000 (UTC)
Received: from [172.64.11.40] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35FE5492BC6;
	Sun, 17 Mar 2024 03:01:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 25 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, 4438a810)
Date: Sun, 17 Mar 2024 03:01:17 -0000
To: shinichiro.kawasaki@wdc.com, yizhan@redhat.com, bhe@redhat.com,
 yiyan@redhat.com, xiawu@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Message-Id: <00586.124031623011700541@us-mta-365.us.mimecast.lan>
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
    Commit message: Merge tag 'firewire-updates-6.9' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/ieee1394/linux1394

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/135360

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         ppc64le - kdump - sysrq-c
                   Issue: [upstream] readpage_elf: Attempt to read non-exis=
tent page at 0x4000000000000000
                          https://gitlab.com/cki-project/kernel-ark/-/issue=
s/132
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700199
         ppc64le - kdump - file-load
                   Issue: [upstream] readpage_elf: Attempt to read non-exis=
tent page at 0x4000000000000000
                          https://gitlab.com/cki-project/kernel-ark/-/issue=
s/132
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700200

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    Unrecognized or new issues:
           s390x - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700146
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
          x86_64 - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11700212
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test
                   s390x - Reboot test
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Storage - blktests - nvme-tcp - upstream
       s390x - Storage - swraid scsi_raid
       s390x - stress: stress-ng - cpu-cache
       s390x - stress: stress-ng - memory
       s390x - Reboot test
       s390x - Memory function: memfd_create
      x86_64 (debug) - Memory function: memfd_create
      x86_64 - Storage - blktests - nvme-tcp - upstream
      x86_64 - Storage - swraid scsi_raid
      x86_64 - stress: stress-ng - cpu-cache
      x86_64 - stress: stress-ng - memory
      x86_64 - Reboot test
      x86_64 - Memory function: memfd_create
      x86_64 - Networking vnic: ipvlan/basic
      x86_64 - Libkcapi AF_ALG test
      x86_64 - Hardware - pciutils: sanity smoke test
      x86_64 - Storage - dm/common
      x86_64 - kdump - kexec_boot
      x86_64 - kdump - kexec-file-load
      x86_64 - kselftests upstream - net
      x86_64 - kselftests upstream - bpf
      x86_64 - kselftests upstream - bpf_test_progs
      x86_64 - Reboot test


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

