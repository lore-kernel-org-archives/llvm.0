Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE45E156C8
	for <llvm@lists.linux.dev>; Fri, 27 Oct 2023 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LoglJyxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698397309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0AhArftzaLVZpfdrytS4KkUTZvByRm5Drc++qM79RBU=;
	b=LoglJyxjm7RzLIzKH/sIqGwFplMC6h+TPXXliIQnpTYzsBTmC+gTf+oOIirRq+PjuPDBIe
	JF+8GztVvftXynFl/qdBdCaRIsU2YzP4UChKavmg7Z9l67yotnbaT/CrfjOOz98sFHaVXo
	MT4PZOvBnhqN9Yf8FeRB1Nwbaa2BRH4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-tHCBBjgvPm2OyfgUU8yOIA-1; Fri,
 27 Oct 2023 05:01:47 -0400
X-MC-Unique: tHCBBjgvPm2OyfgUU8yOIA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 226843C108CC
	for <llvm@lists.linux.dev>; Fri, 27 Oct 2023 09:01:47 +0000 (UTC)
Received: from [172.64.15.15] (unknown [10.30.32.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09872492BE0;
	Fri, 27 Oct 2023 09:01:47 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 7 of 230): Test report for master
 (6.6.0-rc7, mainline.kernel.org-clang, 3a568e3a)
Date: Fri, 27 Oct 2023 09:01:46 -0000
To: llvm@lists.linux.dev, jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Message-Id: <22594.123102705014700721@us-mta-66.us.mimecast.lan>
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
    Commit message: Merge tag 'soc-fixes-6.7-3' of git://git.kernel.org/pub=
/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/111539

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10077564
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10077434
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10077274
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] readpage_elf: Attempt to read non-existent page a=
t 0x4000000000000000
            URL: https://gitlab.com/cki-project/kernel-ark/-/issues/132
            Affected tests:
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
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
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs



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

