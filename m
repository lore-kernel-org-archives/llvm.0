Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD54EC0
	for <llvm@lists.linux.dev>; Sat, 16 Sep 2023 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694856084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=96qwmCmqzY1TmXSY4YzQKh4EU7vVxrl87xlEaRbBUJU=;
	b=f8P+sbpHRaEa3McAPIYBa3UQXy1thCzliKU5sWfzfCsDKqrOuq9GaDyE4wmYdE8MU8wa0c
	+tT3y0BzdEfuTXn7RD2cr4s3q4ixJTgkT5R/lgG2JGXZz+EAHEP+hBEFpjvrLMo9h9ZeWc
	dBp6t9UUP6Bb1oJ3YwsYtmv3vN/GT/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-fGzd7nXzORa9jYff2TFRHQ-1; Sat, 16 Sep 2023 05:21:22 -0400
X-MC-Unique: fGzd7nXzORa9jYff2TFRHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF3E485A5A8
	for <llvm@lists.linux.dev>; Sat, 16 Sep 2023 09:21:21 +0000 (UTC)
Received: from [172.64.4.92] (unknown [10.30.32.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5B63200BC7F;
	Sat, 16 Sep 2023 09:21:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 20 of 234): Test report for master
 (6.6.0-rc1, mainline.kernel.org-clang, d8d7cd65)
Date: Sat, 16 Sep 2023 09:21:21 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <37359.123091605212200161@us-mta-459.us.mimecast.lan>
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
    Commit message: Merge tag 'nfsd-6.6-1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/104738

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9545949
                   Non-passing subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9545959
                   Non-passing subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] _panic: _pfx_dmub_abm_set_pipe.isra.0+0x10/0x10 [=
amdgpu]
            URL: https://lore.kernel.org/all/aea57c5f-2d20-c589-ad44-a63f11=
33a3db@linux.intel.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
        Issue: Storage - mdadm upstream test: wrong regex on 06name test.
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1722
            Affected tests:
                 aarch64 - Storage - mdadm upstream test
                 ppc64le - Storage - mdadm upstream test
                  x86_64 - Storage - mdadm upstream test
        Issue: [upstream] avc:  denied  { write } for  pid=3D1274 comm=3D"k=
exec" path=3D2F6D656D66643A6B65726E656C202864656C6574656429 dev=3D"tmpfs" i=
no=3D2048 scontext=3Dsystem_u:system_r:kdump_t:s0 tcontext=3Dsystem_u:objec=
t_r:tmpfs_t:s0 tclass=3Dfile permissive=3D1
            URL: https://github.com/fedora-selinux/selinux-policy/pull/1860
            Affected tests:
                 aarch64 - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
        Issue: [rawhide] kdump - sysrq-c: kdump: kexec: failed to load kdum=
p kernel
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2052949#c1
            Affected tests:
                 aarch64 - kdump - sysrq-c
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

