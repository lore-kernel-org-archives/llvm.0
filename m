Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B4B1D7E5C
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266130; cv=none; b=Hff9lCfiYvCGZ0/fRTp980/ud9GZtQyInNc0ivuYjUSHh3oL7zSfpATUAI6XdVBhTfrATIbGX7+6xVoWJ2Q9pEFZeA8yv0K70RQDQGdUqU57jlwPz7/FQhs6ZqClEeDme5ClTZn7rFVImsC8wRjcj+QplNiDpYjHNw8VCKUOsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266130; c=relaxed/simple;
	bh=o5BA5FEXQFFLYWDUXz/jNJgWn5D4w0M6MKbAmQqDHYs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Cv1PgW0NuyJie22qYXto2gCUIHUVPgddqKHuI3MtEMSJz15olUyl+KCvkhAdFKPTaFWe2Aw6ht4hdB0txnrg+L7FO+ZbprhXvuk2om3cNmeQ6v8fqy7gn1EmaeHW3Wnexb0eGvzpqI+7AS7PIx6XV9Sw+SPCo0ODFNDEJsPTMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZ8L9RH5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZ8L9RH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729266127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TgHGYDaAhgitYhdg7WA4TvLP6FG/GezQT3bDvegS01Q=;
	b=ZZ8L9RH53FbFS2tbFClR8poikWWF8xK93mTxrg1FgsTdD7yjwXiTvzIi042YQhTV7Rr5Wq
	fzQt+Hx6/ZvpEjhMwZhh/Yzn0kIuF0QP//E7l9bx7aCeZdQmb6PXh+TlnM+zQS5VDvwGkr
	VmkPDBkj73xryG9iPej9Y4ThYc+4U8s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-mOTNzISOONWo9aMZzhAx6w-1; Fri,
 18 Oct 2024 11:42:06 -0400
X-MC-Unique: mOTNzISOONWo9aMZzhAx6w-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E738D1955F3E
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 15:42:05 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3093419560AD;
	Fri, 18 Oct 2024 15:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, ef444a0a)
Date: Fri, 18 Oct 2024 15:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <35198.124101811420601461@us-mta-646.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'powerpc-6.12-5' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1502356726

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502356726-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502356726-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1502356726-x86_64-kernel-debug


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

