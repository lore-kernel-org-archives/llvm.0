Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC4610D
	for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562130; cv=none; b=WTZAa3uOu6elFnn5Nc/j95ds2XNSMgxoe0NNH/dMuLY7k5+Oh4EzyURHG1a+yJ97sRyqMbr2R+2ZwhYUjCsCppHo+5+Wez5vdCkI32irQ6PKQbpRZpsFHZlLqB47zuajhzIXSXGdWSLjOcrstb7xYWwW2/idYCmjRZT49ALSy1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562130; c=relaxed/simple;
	bh=ioNeN3u0Ixf8Rv+IQKLCjuK0yBcJRUF5GRUXHeVNU24=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kbkGtuJs/Go4U18HMTD5wBEzsu8SJamqaCQpSTu7lQ2m7g1AG7jUaNMZJ1089PRnsH4kQ0p5hrK6iSSJE4QOIf8Ddu/xpa7hP24nBiOue+b804nBzWkjOwSC/JAHBd5xfRhAYHRrKddAkr3KNE3JGSI6hwOButBBTN5tJFrDZAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJP7PweU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJP7PweU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736562126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bl20gZZ8v7qKeoktVQpAYDIbtBoCHou9c9h0wLEHCJc=;
	b=BJP7PweUSuxZDS6/AepJvD9FAVbJDiL1EjWz5aXKoptzQ5o+nWtal7bnrgjO/t8FaBCCFx
	JP6+k1BnLQKATTrAEsQZR7FmuxbL8Ml+SToeKp6M/5N7OqkfdPZ4reUObEZ3TAy26szn5d
	J6gTaj1wTUAzegVY2/FADFWYRIzbH+4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-jFiIUqd6POm8oUmO_0t9Ew-1; Fri,
 10 Jan 2025 21:22:05 -0500
X-MC-Unique: jFiIUqd6POm8oUmO_0t9Ew-1
X-Mimecast-MFC-AGG-ID: jFiIUqd6POm8oUmO_0t9Ew
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EDFE19560BB
	for <llvm@lists.linux.dev>; Sat, 11 Jan 2025 02:22:04 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C14A195E3D9;
	Sat, 11 Jan 2025 02:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 77a903cd)
Date: Sat, 11 Jan 2025 02:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <33538.125011021220500271@us-mta-9.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GVba1RMBHLekkGNvrjXwcRbQtEJOtUzSTmg0R0AoW5o_1736562124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: MAINTAINERS: powerpc: Update my status

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1620450154

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1620450154-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1620450154-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1620450154-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

