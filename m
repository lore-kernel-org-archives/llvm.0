Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F918018;
	Tue,  9 May 2023 16:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B120C433D2;
	Tue,  9 May 2023 16:46:01 +0000 (UTC)
Date: Tue, 9 May 2023 12:45:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: kernel test robot <lkp@intel.com>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "chinglinyu@google.com" <chinglinyu@google.com>, Nadav Amit
 <namit@vmware.com>, Srivatsa Bhat <srivatsab@vmware.com>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>, Alexey Makhalov
 <amakhalov@vmware.com>, Vasavi Sirnapalli <vsirnapalli@vmware.com>, Tapas
 Kundu <tkundu@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>
Subject: Re: [PATCH v2 8/9] eventfs: moving tracing/events to eventfs
Message-ID: <20230509124559.0d5557ad@rorschach.local.home>
In-Reply-To: <1CAC8265-A4F3-4AF6-80E4-8F264ED670A9@vmware.com>
References: <1683026600-13485-9-git-send-email-akaher@vmware.com>
	<202305030116.Gu6yyvKj-lkp@intel.com>
	<1CAC8265-A4F3-4AF6-80E4-8F264ED670A9@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 9 May 2023 12:29:23 +0000
Ajay Kaher <akaher@vmware.com> wrote:

> =EF=BB=BF> On 02/05/23, 11:42 PM, "kernel test robot" <lkp@intel.com> wro=
te: =20
> >   >> kernel/trace/trace_events.c:2424:17: warning: variable 'd_events' =
set but not used [-Wunused-but-set-variable] =20
> >           struct dentry *d_events;
> >                       ^
> >    1 warning generated.
> > =20
>=20
> Steve, with-in event_create_dir(), do we have any scenario when file->eve=
nt_call->class->system
> doesn't have TRACE_SYSTEM? And need to execute following:
>=20
> ae63b31e4d0e2e Steven Rostedt           2012-05-03  2437                d=
_events =3D parent;
>=20
> looking for your input if we could remove d_events from event_create_dir(=
).
>=20

I have hit this in the beginning, but I don't think it's an issue
anymore. Perhaps just have it be:

        if (WARN_ON_ONCE(strcmp(call->class->system, TRACE_SYSTEM) =3D=3D 0=
))
		return -ENODEV;

        ef_subsystem =3D event_subsystem_dir(tr, call->class->system, file,=
 parent);

Hmm, how about just add this patch before your patch set:

-- Steve

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [PATCH] tracing: Require all trace events to have a TRACE_SYSTEM

The creation of the trace event directory requires that a TRACE_SYSTEM is
defined that the trace event directory is added within the system it was
defined in.

The code handled the case where a TRACE_SYSTEM was not added, and would
then add the event at the events directory. But nothing should be doing
this. This code also prevents the implementation of creating dynamic
dentrys for the eventfs system.

As this path has never been hit on correct code, remove it. If it does get
hit, issues a WARN_ON_ONCE() and return ENODEV.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---

  (lightly tested)

 kernel/trace/trace_events.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 654ffa40457a..16bc5ba45507 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2424,14 +2424,15 @@ event_create_dir(struct dentry *parent, struct trac=
e_event_file *file)
=20
 	/*
 	 * If the trace point header did not define TRACE_SYSTEM
-	 * then the system would be called "TRACE_SYSTEM".
+	 * then the system would be called "TRACE_SYSTEM". This should
+	 * never happen.
 	 */
-	if (strcmp(call->class->system, TRACE_SYSTEM) !=3D 0) {
-		d_events =3D event_subsystem_dir(tr, call->class->system, file, parent);
-		if (!d_events)
-			return -ENOMEM;
-	} else
-		d_events =3D parent;
+	if (WARN_ON_ONCE(strcmp(call->class->system, TRACE_SYSTEM) =3D=3D 0))
+		return -ENODEV;
+
+	d_events =3D event_subsystem_dir(tr, call->class->system, file, parent);
+	if (!d_events)
+		return -ENOMEM;
=20
 	name =3D trace_event_name(call);
 	file->dir =3D tracefs_create_dir(name, d_events);
--=20
2.39.2

