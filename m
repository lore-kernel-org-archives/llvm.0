Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061FEBE4D
	for <llvm@lists.linux.dev>; Sun, 14 Apr 2024 00:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713052900; cv=none; b=PnFssfw0x91sCWQnetl7TzP+IrqAdKmkbxSJTYEt/wh/HgC7JgXznyuTMWAqVzzmOJ8w/wkrNw8rDbMWHBlXrFvXWjRliF9rjyjm84K06g4L5hWPKlespUPzA/QdxfGn9a1J/MLI1JPMVsowQFOGZWGuBRj28+R19r2hCRwXBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713052900; c=relaxed/simple;
	bh=pMdXSf13iR5glmSFsVOEjfEJ6nQM8mhY8fV6eRxMYV4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Y/CxDRgGpWVDoGtI70VYKvhsiNh5Re8dMSYSPxAMjz1apZyT32uLeRNrA/mA3W0vBLc3pIcnB7UeVQh34xSsJLmiUkHXmqSEc2MGaP+Klz63tazjASqX5JDqR9uy/fBEsV7+4kUslTN8SRDgha7iBK6gdvNoQANtcq/IGh8hrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W6bJfbz2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W6bJfbz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713052896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dVOFfBcfHcyKGqgvPG+YnnxzeGmaCQUxpiBVWyQmkrE=;
	b=W6bJfbz25MF3pWSG4L+eGZyQi8UfoWWz//NzWD57fmCd4Y8wXk1h7WXM5Q/oLG3Yqqu4Tg
	z0f6iOQpXCPeYAGj3m6Pd+8gUlk27Hvc/FTW5+ILgsXBVJYmdEOxfYRGi8siuFyNKqJhGg
	HD94hco3UEpvUatJyPtioxNYNmtW7IY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-29-Y1VnJOnEO1KoimePJT6Mmw-1; Sat,
 13 Apr 2024 20:01:35 -0400
X-MC-Unique: Y1VnJOnEO1KoimePJT6Mmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1D0D3806272
	for <llvm@lists.linux.dev>; Sun, 14 Apr 2024 00:01:34 +0000 (UTC)
Received: from [172.64.9.46] (unknown [10.30.34.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0625AC0157D;
	Sun, 14 Apr 2024 00:01:33 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 21 of 204): Test report for master
 (6.9.0-rc3, mainline.kernel.org-clang, e8c39d0f)
Date: Sun, 14 Apr 2024 00:01:33 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <57220.124041320013500139@us-mta-29.us.mimecast.lan>
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
    Commit message: Merge tag 'probes-fixes-v6.9-rc3' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/140157

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11988962
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129
                       =E2=9D=8C FAIL generic/135
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/169
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/208
                       =E2=9D=8C FAIL generic/210
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/245
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/249
                       =E2=9D=8C FAIL generic/257
                       =E2=9D=8C FAIL generic/308
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/310
                       =E2=9D=8C FAIL generic/339
                       =E2=9D=8C FAIL generic/340
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11988961
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
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
                Storage - blktests - blk - upstream [s390x, x86_64]
        Issue: blktests block/024 failed
            URL: https://issues.redhat.com/browse/RHEL-8130
            Affected tests:
                Storage - blktests - blk - upstream [s390x]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [s390x, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [aarch64, x86_64 (debug)]
    CKI/restraint [aarch64, x86_64 (debug)]
    machineinfo [aarch64, x86_64 (debug)]
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    Reboot test [aarch64, x86_64 (debug)]
    SELinux Custom Module Setup [aarch64, x86_64 (debug)]
    Storage - blktests - blk - upstream [aarch64]
    Storage - blktests - nvme-tcp - upstream [aarch64]
    Storage - swraid scsi_raid [aarch64, x86_64 (debug)]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]


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

