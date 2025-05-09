Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7B523CEF8
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 19:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820333; cv=none; b=ZEmUBxip+7ldVpbagMKCJSGOJzwFwzDCdVmXKCgXdviNzdaO5/O209P+dyD/y3uUZuBSiaMHQwf/Zz9xkO2Y0Xa9InS0KQq1ibSzEhCNOsIzYQl23ljCnLqU61EXPSWttqbwW5y1JSozBDklf2H20K55COpy6n0hL/95Fo1ejyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820333; c=relaxed/simple;
	bh=KKywKoKJDqQBxA/Z8witldaXxdxZlxP+mHpV5Nsz0ys=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tzhCyCv7TEW0Bn8R0uBJQ1EEkan0RHE8chqVFcGVViYXmowIHLldxDgilNXKs0PsxtpryL2R+3Id7SZ0tv1nj/MuIky9h/py48rfn3TjGdrXPqM+WUI8S5QbNV1d76W5h+Yq/TULQhJM3ocXfH4Isf79nJsgvuduwbY5QxhgzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vfbuf7Ah; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vfbuf7Ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746820329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yMg4hFfhBKNZpncAwx9F4r+8RTMgbOG1Bs0ycipagoY=;
	b=Vfbuf7AhWqtHOtGVSRUToKXjItIn9pmqi7UljzhYIWWG5GHgk7vXis9dDfUZdOytoHiEab
	RLs1nTAhF1YkXmuGsjrTyN2CCnRQJUZcOhEBV8eikvnacKQyGpHM+z1rY87s7ZLDv4VJIj
	u3j5jc1lp+lHiJtZ6Ow1lRgi6GmawCo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-zHiK9XNqOsWaDcEpqiVjwg-1; Fri,
 09 May 2025 15:52:07 -0400
X-MC-Unique: zHiK9XNqOsWaDcEpqiVjwg-1
X-Mimecast-MFC-AGG-ID: zHiK9XNqOsWaDcEpqiVjwg_1746820326
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB09818004A7
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 19:52:06 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BE4B195607A;
	Fri,  9 May 2025 19:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, 3013c33d)
Date: Fri, 09 May 2025 19:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <70895.125050915520703508@us-mta-526.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3N6lsb4AYUl9ql5vz65Shh2nZGfSIHMnAr63NTVRPK0_1746820326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'riscv-for-linus-6.15-rc6' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/riscv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1809886420

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1809886420-x86_64-kernel-debug


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

