Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB723E1689
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718934; cv=none; b=l7Br7mRcJaSjMhxaG1OE85ryHzLuo5AXgwNl82isF9wb4duQ1hH4549Jxn4Lf38v94kxgqSY6i/WfcKArX1vDRceWKHoRX9WgFQDzYa+f3OimowSeuCiBs35XPrb6gV7Y6sUGyfZ6d6eN2i9/fIJbcatu1VUMF9Go4OFvFWnLhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718934; c=relaxed/simple;
	bh=iE0rbsW2APAb4cUKREJv0rQBtyhl9sjf00FAv7lOKp0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WXwQ08nBac8CoDwATe1Jp2J0e8DMnuF+Rs6H4PsE1PT+fMeKMZO9/CFriDP/KsFZNqY4ryD2tYQeul1ffIDBhYFDj9jnJoqzzARxFOwuVEtT6RezutOaraDtJbfFEBx4thMn6t9/8iT3OqlDlWwBoNG2KBH/39ofE9nscO3ktC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PYbBEWBv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PYbBEWBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782718928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JRjg0cqKcTL9Qdvjt9Ryt68OAPGFlqb+v+WQ1au1Xvg=;
	b=PYbBEWBvOl/Z3rkxp16h1WkOvfEVX77kKhE+E0u4WvCvEisuIgNxm1sNpXjz6FQO+309N6
	wYSI/y93RmczaxR/eGFH5S08x637jqnS1XKn5ibUSKu5Zx3oeub0tmGMHTAYofQsQj+x65
	VqdVUrATcciZcp5KVBOSmfdm+WWMgpw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-552-6G9fyDmCPQ6iat-oOLO0WQ-1; Mon,
 29 Jun 2026 03:42:07 -0400
X-MC-Unique: 6G9fyDmCPQ6iat-oOLO0WQ-1
X-Mimecast-MFC-AGG-ID: 6G9fyDmCPQ6iat-oOLO0WQ_1782718926
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7BC14195604C
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 07:42:06 +0000 (UTC)
Received: from [172.20.60.60] (unknown [10.30.44.61])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE5743000232;
	Mon, 29 Jun 2026 07:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, dc59e4fe)
Date: Mon, 29 Jun 2026 07:42:05 -0000
To: omosnace@redhat.com, mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <38332.126062903420700413@us-mta-552.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mrL-mkNf2hWqIA3r9Y2yONeN9E-EGzv9PKrykWnlCBU_1782718926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Linux 7.2-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2635573132

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2635573132_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635573132_s390x_kernel_kcidb_tool_21540250_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635573132_aarch64_kernel_kcidb_tool_21540255_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635573132_x86_64_kernel_kcidb_tool_21540252_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test



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

