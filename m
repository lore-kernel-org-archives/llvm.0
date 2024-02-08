Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BF36B1C
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707420086; cv=none; b=GBDIazF/ZzmgbK6Q7gNCfeSs6HNmS33b+DXhSFAd99zLgwHtTJEiZj35+RTm0a+YIxvFwljl7c/d4pUXDl7jCWZ2nunNnaPJ43xBUIxWUShphlZvt2O6FmiAllwiSFXvWGZbUkh5O9XalhEhYtDZWqesFRP7XF3+AbWTLv3Jbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707420086; c=relaxed/simple;
	bh=lapA5o+CXSfe64D5Kge7i6jadnwzCK60IcivAcWQPFA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rH+nQjXOt3sLI4XYqHsF40AWOxT/0O/PCffZ3APQ+44HlqvnGOc4joYt9052OjkOn7yQv4fu0HZ/jqHOnTd1HuwhIznc7aBOITM1unmUHiBpZdIA09u3kjlRpcRqfAh5xu5ptysB29YC75Z/UA55VUd4SrwX/tXb8qsIS1bjWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gxSJeLLD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gxSJeLLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707420082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bj2/MEt+Ph4GB315eQdXSGCZBUuT8nqe62wXPYukbDo=;
	b=gxSJeLLDe7xSlil6LNoV6RXXZ/PYIUABtc0oRSGI+a/kYCJxRAX7bHMiB99+DioUj0+iA1
	gl1ytOsP7xVgKWqLNbZWb4eOQ8xPxwEEXRlSZ7fNS+tzLgIlhL3PhTyvwbYAaHbqeumKQw
	yrxI1hHtfCChYmIeGLqIAhGpEWJOcTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-iIBHwWgYOWWaniRJI7ftPw-1; Thu, 08 Feb 2024 14:21:20 -0500
X-MC-Unique: iIBHwWgYOWWaniRJI7ftPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95D9B185A782
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 19:21:20 +0000 (UTC)
Received: from [172.64.11.29] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 441441103A;
	Thu,  8 Feb 2024 19:21:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 11 of 226): Test report for master
 (6.8.0-rc3, mainline.kernel.org-clang, 04737196)
Date: Thu, 08 Feb 2024 19:21:20 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <45902.124020814212000909@us-mta-220.us.mimecast.lan>
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
    Commit message: Merge tag 'v6.8-p3' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/128410

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - stress: stress-ng - cpu-cache
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                 aarch64 - stress: stress-ng - memory
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 (debug) - Memory function: memfd_create
      x86_64 (debug) - kselftests upstream - net
      x86_64 (debug) - kselftests upstream - bpf
      x86_64 (debug) - kselftests upstream - bpf_test_progs
      x86_64 - Memory function: memfd_create
      x86_64 - kselftests upstream - net
      x86_64 - kselftests upstream - bpf
      x86_64 - kselftests upstream - bpf_test_progs


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

