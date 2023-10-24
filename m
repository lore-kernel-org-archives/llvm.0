Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DD2328C9
	for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3+vIPIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698159091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QLS9U750KjyeVE44RrH3jk1LPGtHO4/76zQInSJFTXw=;
	b=N3+vIPIQ5MuM/wEEiulFMAaNZf3GaEljW0mPR8K5/aRME8hPZzMGUJcls0Zf9aiZp1z/FD
	phfrbt8p3gblwi12iQRK1BPxSqha63GFQs1MSt/FGevtPUz8OutybnrdOpvtJWUKkz6LMM
	4iHbtgb23mo0+7S0NEB/WjDI6+ZlJmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-9tFAuhDNPN26rPI2f3R02Q-1; Tue, 24 Oct 2023 10:51:20 -0400
X-MC-Unique: 9tFAuhDNPN26rPI2f3R02Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 206E9185A7B2
	for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 14:51:20 +0000 (UTC)
Received: from [172.64.15.15] (unknown [10.30.32.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0FD72026D4C;
	Tue, 24 Oct 2023 14:51:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 7 of 230): Test report for master
 (6.6.0-rc7, mainline.kernel.org-clang, d88520ad)
Date: Tue, 24 Oct 2023 14:51:19 -0000
To: llvm@lists.linux.dev, jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <61908.123102410512003017@us-mta-688.us.mimecast.lan>
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
    Commit message: Merge tag 'pull-nfsd-fix' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/viro/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/110808

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10036780
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10037153
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10036874
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
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
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

